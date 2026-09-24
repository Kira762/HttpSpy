// Offline checks that need no Roblox client:
//   1. every Lua source in the repository compiles with the real Luau compiler
//   2. Serializer.lua passes its behaviour checks
//   3. the serializer embedded in HttpSpy.standalone.lua is byte-identical to the module
//      and passes the same behaviour checks
//   4. HttpSpy.standalone.lua loads inside tests/roblox_stub.luau, exposes the API, logs a
//      request through the embedded serializer and downloads nothing
//   5. the patched upstream mirror resolves its sources from local files and downloads
//      nothing (backup/HttpSpy.lua and init/loader.lua)
//
// Usage:
//   cd tests && npm install && node run_checks.mjs
// Requires Node 18+ and the @luau-rs/luau WebAssembly runtime (dev dependency).
import { Lua, intoLua } from '@luau-rs/luau';
import { readFileSync, readdirSync, statSync } from 'node:fs';
import { dirname, join, relative } from 'node:path';
import { fileURLToPath } from 'node:url';

const here = dirname(fileURLToPath(import.meta.url));
const root = join(here, '..');
const upstreamDir = join(root, 'upstream', 'VexalScripts', 'scripts');

let failures = 0;
const record = (ok, label, detail = '') => {
  console.log(`${ok ? 'OK  ' : 'FAIL'} ${label}${ok || !detail ? '' : ' :: ' + detail}`);
  if (!ok) failures += 1;
};

// Collect every Lua file that ships with the repository (skipping dependencies).
function collectLuaFiles(dir, found = []) {
  for (const entry of readdirSync(dir)) {
    if (entry === 'node_modules' || entry === '.git') continue;
    const path = join(dir, entry);
    if (statSync(path).isDirectory()) collectLuaFiles(path, found);
    else if (entry.endsWith('.lua') || entry.endsWith('.luau')) found.push(path);
  }
  return found;
}

const spySource = readFileSync(join(root, 'HttpSpy.lua'), 'utf8');
const serializerSource = readFileSync(join(root, 'Serializer.lua'), 'utf8');
const standaloneSource = readFileSync(join(root, 'HttpSpy.standalone.lua'), 'utf8');
const stubSource = readFileSync(join(here, 'roblox_stub.luau'), 'utf8');
const serializerChecks = readFileSync(join(here, 'serializer_checks.luau'), 'utf8');
const apiChecks = readFileSync(join(here, 'api_checks.luau'), 'utf8');
const loaderChecks = readFileSync(join(here, 'loader_checks.luau'), 'utf8');

const lua = await Lua.create({ sandbox: false });
console.log(`Luau ${lua.version}\n`);

// The runtime has no loadstring by default; provide the executor-style global the
// vendored scripts expect.
lua.globals.set('loadstring', lua.createFunction((source, chunkName) => {
  if (typeof source !== 'string') {
    return intoLua.multiple(null, 'loadstring: source must be a string');
  }
  try {
    const chunkNameValue = typeof chunkName === 'string' ? chunkName : 'chunk';
    return intoLua.multiple(lua.load(source, { chunkName: chunkNameValue }));
  } catch (error) {
    return intoLua.multiple(null, String(error.message ?? error).slice(0, 300));
  }
}));

// --- 1. syntax ---------------------------------------------------------------
const luaFiles = collectLuaFiles(root);
let syntaxFailures = 0;
for (const file of luaFiles) {
  try {
    lua.compile(readFileSync(file, 'utf8'));
  } catch (error) {
    syntaxFailures += 1;
    record(false, `compiles: ${relative(root, file)}`, String(error.message ?? error).slice(0, 200));
  }
}
record(syntaxFailures === 0, `compiles: ${luaFiles.length} Lua files in the repository`);

// --- 2./3. serializer behaviour + embedding parity ---------------------------
const marker = 'local Serializer = (function()\n';
const markerStart = standaloneSource.indexOf(marker);
const markerEnd = standaloneSource.indexOf('\nend)()\n', markerStart);
if (markerStart === -1 || markerEnd === -1) {
  record(false, 'standalone embeds a serializer block');
} else {
  const embeddedBlock = standaloneSource.slice(markerStart + marker.length, markerEnd + 1);
  const moduleBody = serializerSource.replace(/\s+$/, '').replace(/return Serializer;$/, '');
  record(embeddedBlock === moduleBody + 'return Serializer\n',
    'standalone embeds Serializer.lua byte-for-byte');

  const runSerializerChecks = (label, source) => {
    const prints = [];
    const listener = (event) => prints.push(event.text);
    lua.addEventListener('print', listener);
    let threw = null;
    try {
      lua.execute(`
game = { GetFullName = function() return "Stub" end }
clonefunction = function(fn) return fn end
typeof = type
local Serializer = (function()
${source}
end)()
${serializerChecks}`);
    } catch (error) {
      threw = String(error.message ?? error);
    }
    lua.removeEventListener('print', listener);
    for (const line of prints) console.log(`     ${line}`);
    const failedChecks = prints.filter((line) => line.startsWith('CHECK FAIL'));
    record(!threw && failedChecks.length === 0,
      `serializer checks: ${label}`,
      threw ?? failedChecks.join(' | '));
  };

  runSerializerChecks('Serializer.lua module', serializerSource);
  runSerializerChecks('copy embedded in HttpSpy.standalone.lua', embeddedBlock);
}

// --- 4./5. scenarios inside the stub Roblox environment ----------------------
const luauStringTable = (entries) =>
  `{\n${Object.entries(entries).map(([key, value]) => `  [${JSON.stringify(key)}] = ${JSON.stringify(value)},`).join('\n')}\n}`;

const runScenario = (label, { virtualFiles, extraSetup = '', source, checks }) => {
  const prints = [];
  const listener = (event) => prints.push(event.text);
  lua.addEventListener('print', listener);
  let threw = null;
  try {
    lua.execute(`
__virtualFiles = ${luauStringTable(virtualFiles)}
${stubSource}
${extraSetup}
local __ok, __result = xpcall(function(...)
${source}
end, function(err) return tostring(err) end)
${checks}`);
  } catch (error) {
    threw = String(error.message ?? error);
  }
  lua.removeEventListener('print', listener);
  for (const line of prints) console.log(`     ${line}`);
  const failedChecks = prints.filter((line) => line.startsWith('CHECK FAIL'));
  record(!threw && failedChecks.length === 0, label, threw ?? failedChecks.join(' | '));
};

runScenario('HttpSpy.standalone.lua loads and logs through the embedded serializer', {
  virtualFiles: {},
  extraSetup: 'local __label = "standalone"\nlocal __expectLocalReads = false',
  source: standaloneSource,
  checks: apiChecks,
});

runScenario('mirror backup/HttpSpy.lua resolves the serializer from a local file', {
  virtualFiles: {
    'HttpSpy/upstream/VexalScripts/scripts/backup/Serializer.lua': serializerSource,
  },
  extraSetup: 'local __label = "mirror HttpSpy"\nlocal __expectLocalReads = true\nlocal __expectApiTable = false',
  source: readFileSync(join(upstreamDir, 'backup', 'HttpSpy.lua'), 'utf8'),
  checks: apiChecks,
});

runScenario('mirror init/loader.lua loads GuiLoader.lua and the game script locally', {
  virtualFiles: {
    'HttpSpy/upstream/VexalScripts/scripts/GuiLoader.lua': readFileSync(join(upstreamDir, 'GuiLoader.lua'), 'utf8'),
    'HttpSpy/upstream/VexalScripts/scripts/ChickenFarm.lua': '__genv.__localEndpointRan = (__genv.__localEndpointRan or 0) + 1\n',
  },
  extraSetup: 'game.GameId = 10209534490',
  source: readFileSync(join(upstreamDir, 'init', 'loader.lua'), 'utf8'),
  checks: loaderChecks,
});

// --- summary -----------------------------------------------------------------
console.log('');
if (failures > 0) {
  console.error(`${failures} check(s) failed`);
  process.exit(1);
}
console.log('all checks passed');
