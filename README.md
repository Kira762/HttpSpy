# HttpSpy

Roblox/Luau HTTP request spy with a local serializer, plus a vendored mirror of the
[VexalScripts/scripts](https://github.com/VexalScripts/scripts) repository whose remote
code-loading dependencies have been replaced with local file / ModuleScript connections.

The spy hooks executor request functions (`http.request`/`syn.request`, `game.HttpGet`,
`game.HttpPost`, websockets) and logs every call with the serializer. It needs an executor:
it uses `hookmetamethod`, `hookfunction`, `newcclosure`, `getgc`, `readfile`/`writefile`
and friends. Only inspect traffic in environments where you are authorized to do so.

## Layout

```
HttpSpy.lua                     ModuleScript version of the spy (source of truth)
Serializer.lua                  ModuleScript serializer (source of truth)
HttpSpy.standalone.lua          generated single file: serializer embedded, no downloads
tools/
  build_standalone.py           builds / verifies HttpSpy.standalone.lua
  check.py                      offline structure, manifest and remote-load audit
  update_manifest.py            refreshes the mirror's local hashes after a patch
  fetch_local_deps.py           downloads the optional third-party modules (see below)
tests/
  run_checks.mjs                Luau compile + runtime checks (Luau WebAssembly runtime)
  roblox_stub.luau              stub Roblox/executor environment used by the runtime checks
docs/UPSTREAM.md                mirror provenance, remote-load audit, every patch applied
upstream/VexalScripts/scripts/  byte-for-byte mirror of VexalScripts/scripts @ 09adeea,
                                patched only where a runtime download was replaced
upstream/VexalScripts/manifest.json   upstream + local SHA-256 for all 15 vendored files
upstream/VexalScripts/deps/     place for the optional third-party modules (git-ignored)
```

## Running the spy

### 1. ModuleScripts (Roblox Studio with an executor environment)

Put `HttpSpy` and `Serializer` under the same parent and require the spy:

```lua
local HttpSpy = require(script.Parent.HttpSpy)
```

`HttpSpy.lua` connects to the serializer with `local Serializer = require(script.Parent.Serializer)`;
there is no download involved. `require` runs the spy with its built-in default options -
edit the `options` table at the top of `HttpSpy.lua` if you need different defaults.

When run through `loadstring` you can pass your own options as the first argument:

```lua
local HttpSpy = loadstring(readfile("HttpSpy.lua"))({
    AutoDecode = true,
    Highlighting = true,
    SaveLogs = true,
    GuiEnabled = true
})
```

### 2. Raw loadstring (executor, single file)

`HttpSpy.standalone.lua` embeds `Serializer.lua`, so this needs **no second download** and
no `script.Parent` ModuleScript:

```lua
local HttpSpy = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Kira762/HttpSpy/refs/heads/main/HttpSpy.standalone.lua"))()
```

JSON responses are decoded when `AutoDecode` is on - including on executors that return
lowercase header names (`["content-type"] = "application/json"`, the HTTP/2 and HTTP/3
normalisation), so `Body` shows up as a table in the log instead of a JSON string.

That URL tracks `main`. If you are testing an unmerged branch, swap `main` for the branch
name (`refs/heads/<branch>/HttpSpy.standalone.lua`). Any URL that serves the raw file works,
including a local one (`readfile("HttpSpy.standalone.lua")`).

The file ends with `return result`, so the returned table is the spy API:
`API.OnRequest`, `API:HookSynRequest(url, hook)`, `API:ProxyHost(host, proxy)`,
`API:RemoveProxy(host)`, `API:UnHookSynRequest(url)`, `API:BlockUrl(url)`,
`API:WhitelistUrl(url)`, `API:ToggleGui(visible)`, `API:SetGuiPosition(position)`,
`API:SetGuiSize(size)`, `API:RenameLogFile(name)`, `API:GetLogFileName()`,
`API:SaveLogs()`, `API:SetSaveMode(mode)`.

`RenameLogFile(name)` moves the on-disk log file to a new name (sanitised so it
always stays inside the executor workspace); `GetLogFileName()` returns the current
path. Set `options.LogName` at startup to choose the initial file name. Logs are
written automatically by default; set `options.SaveMode = "manual"` (or call
`API:SetSaveMode("manual")`) to buffer them in memory and flush on demand with
`API:SaveLogs()` (or the GUI "Save" button, shown only in manual mode).

### Rebuilding the standalone file

```bash
python3 tools/build_standalone.py           # regenerate
python3 tools/build_standalone.py --check   # fail if it is out of sync
```

The build embeds the body of `Serializer.lua` verbatim (a `formatString` forward
declaration in `Serializer.lua` was added so `FormatArguments` works for string arguments;
`tools/check.py` and the runtime checks cover it). Never edit `HttpSpy.standalone.lua` by
hand - edit the two source modules and rebuild.

## Vendored VexalScripts mirror

`upstream/VexalScripts/scripts/` is a copy of the public `VexalScripts/scripts` repository
at commit `09adeea8` (2026-09-24). The import commit is unmodified; four files are then
patched so they no longer download and execute code at runtime:

| File | Upstream behaviour | Now |
| --- | --- | --- |
| `backup/HttpSpy.lua` | `loadstring(game:HttpGet(".../backup/Serializer.lua"))()` | sibling ModuleScript, then a local file |
| `init/loader.lua` | downloads and runs `GuiLoader.lua` and the per-game script | local files first |
| `backup/VexExplorer.lua` | downloads + runs `saveinstance.luau`, runs `VexVersion.lua` for a version string | local file first; the version check no longer executes code |
| `backup/obsidian/Library.lua` | downloads and runs the lucide icon source | local file first |

Each patch is marked with `-- [local-patch]` and explained in `docs/UPSTREAM.md`, which also
contains the full URL-by-URL audit. Remaining downloads are opt-in only
(`getgenv().VexalScriptsAllowRemote`, `getgenv().VexExplorerAllowRemote`,
`getgenv().ObsidianAllowRemoteCode`) and default to off; attribution comments and URLs used
for ordinary HTTP behaviour (asset images, the `api.lua.expert` decompile call, the spy's own
hook targets) are untouched.

Optional third-party modules are **not** committed (`upstream/VexalScripts/deps/README.md`
explains why). Fetch them into the ignored `deps/` folder with:

```bash
python3 tools/fetch_local_deps.py
```

The obfuscated payloads (`ChickenFarm.lua`, `DeagleArena.lua`, `DuelsMurderVsSheriff.lua`,
`MurderVsSheriffDuels.lua`, `backup/SanityChecks.lua`, `KnifeDuels.lua`) are copied
unchanged; they contain no literal URLs but are virtual-machine blobs whose real behaviour
cannot be inspected statically. Treat them as untrusted code.

## Checks

```bash
python3 tools/check.py            # no dependencies, no network
cd tests && npm install && node run_checks.mjs   # Luau compile + runtime checks
```

`tools/check.py` verifies the standalone build is in sync, that `HttpSpy.lua` and
`Serializer.lua` are still connected locally, that the mirror matches
`upstream/VexalScripts/manifest.json`, and that no new remote code-load site appeared.
`--fetch-upstream` additionally re-downloads the pinned upstream commit and compares hashes.

`tests/run_checks.mjs` compiles every Lua file with the real Luau compiler and then runs
`HttpSpy.standalone.lua` and the two patched mirror scripts inside a stub Roblox/executor
environment (`tests/roblox_stub.luau`), asserting that they load, expose the expected API,
log a request through the embedded serializer, and download nothing.

### What is not runtime-tested

The stub environment is not Roblox: the screen GUI, the `hookmetamethod`/`hookfunction`
behaviour, executor file APIs, a real request round-trip and the remaining vendored scripts
(`VexExplorer.lua`, the Obsidian library, the obfuscated payloads) are not executed here.
They are syntax-checked only. Verify those in a Roblox session with the executor you target.

## Attribution

* HttpSpy originally by [bebomods / NotDSF](https://github.com/NotDSF), upgraded by
  Vexal Scripts; both credits are preserved in the script headers.
* Upstream files are vendored from <https://github.com/VexalScripts/scripts>; see
  `docs/UPSTREAM.md` for commit, hashes and per-file notes.
* The serializer header states it is not written by Vexal Scripts.
