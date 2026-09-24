# VexalScripts upstream mirror and remote-load audit

This document describes the copy of [`VexalScripts/scripts`](https://github.com/VexalScripts/scripts)
that lives in `upstream/VexalScripts/scripts/`, every place in it that downloaded or
executed code, and what replaced those downloads.

## Provenance

| | |
| --- | --- |
| Repository | <https://github.com/VexalScripts/scripts> (public) |
| Commit | `09adeea85efdbb125c681bc7431a279a72125a79` (`main`, commit message: "Update MurderVsSheriffDuels.lua") |
| Fetched | 2026-09-24 |
| Mirror path | `upstream/VexalScripts/scripts/` (upstream layout preserved exactly) |
| Files | 15 (15 `.lua`, 6.2 MB) |
| Licence | none declared upstream - the copy is kept as reference material with attribution intact |
| Hashes | `upstream/VexalScripts/manifest.json` records the upstream and local SHA-256 of every file |

Git history keeps the import reviewable: the first commit (`chore(upstream): import
VexalScripts/scripts @ 09adeea unmodified`) is byte-for-byte upstream, later commits apply
the local-loading patches below. `python3 tools/check.py --fetch-upstream` re-downloads the
listed commit and compares the recorded hashes.

## Inventory

"Remote URLs" counts literal `http(s)://` occurrences. Sizes and counts are taken from the
current mirror, so the four patched files are slightly larger than upstream. Obfuscated files
cannot be audited statically - see [Not localized](#not-localized) below.

| File | Bytes | Lines | Remote URLs | `loadstring` | `HttpGet` | Patched |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| `ChickenFarm.lua` | 1,163,921 | 4 | 0 | 0 | 0 | no |
| `DeagleArena.lua` | 986,445 | 4 | 0 | 0 | 0 | no |
| `DuelsMurderVsSheriff.lua` | 839,636 | 4 | 0 | 0 | 0 | no |
| `GuiLoader.lua` | 5,302 | 58 | 0 | 0 | 0 | no |
| `KnifeDuels.lua` | 531,467 | 4 | 1 (credit comment) | 0 | 0 | no |
| `MurderVsSheriffDuels.lua` | 1,545,505 | 4 | 0 | 0 | 0 | no |
| `backup/Developers.lua` | 38 | 2 | 0 | 0 | 0 | no |
| `backup/HttpSpy.lua` | 27,218 | 671 | 2 | 2 | 6 | **yes** |
| `backup/SanityChecks.lua` | 690,105 | 4 | 0 | 0 | 0 | no |
| `backup/Serializer.lua` | 7,641 | 264 | 0 | 0 | 0 | no |
| `backup/VexExplorer.lua` | 356,417 | 3,712 | 4 | 8 | 3 | **yes** |
| `backup/obsidian/Library.lua` | 193,447 | 2,015 | 5 | 2 | 2 | **yes** |
| `backup/obsidian/SaveManager.lua` | 15,565 | 167 | 0 | 0 | 0 | no |
| `backup/obsidian/ThemeManager.lua` | 16,501 | 175 | 0 | 0 | 0 | no |
| `init/loader.lua` | 4,096 | 116 | 2 | 2 | 1 | **yes** |

## Remote-load audit

Every site that fetched code and ran it, and what happens now. Line numbers refer to the
pristine import; `git show` the import commit to see them unchanged.

| Site (pristine line) | What it did | Now |
| --- | --- | --- |
| `backup/HttpSpy.lua:34` | `loadstring(game:HttpGet(".../backup/Serializer.lua"))()` | sibling ModuleScript, then a local file; **no remote path** |
| `init/loader.lua:34` | `loadstring(game:HttpGet(url, true))()` for `GuiLoader.lua` and the per-game script | local files first; download only with `getgenv().VexalScriptsAllowRemote = true` |
| `backup/VexExplorer.lua:431` | downloads `luau/UniversalSynSaveInstance/main/saveinstance.luau` and `loadstring`s it | local `deps/saveinstance.luau` first; download only with `getgenv().VexExplorerAllowRemote = true` |
| `backup/VexExplorer.lua:3637` | `loadstring(game:HttpGet(".../VexVersion.lua"))()` - remote code execution just to read a version string | local file when present, otherwise the pinned upstream value `V1.11E`; **no code execution** |
| `backup/obsidian/Library.lua:183` | `loadstring(game:HttpGet("gitlab.com/upio/lucide-roblox-direct/.../source.lua"))()` | local `deps/lucide-roblox/source.lua` first; download only with `getgenv().ObsidianAllowRemoteCode = true` |

Unchanged on purpose (not code loading):

| Site | Purpose |
| --- | --- |
| `backup/VexExplorer.lua:139` | POST to the `api.lua.expert/decompile` service (user-initiated decompilation) |
| `backup/VexExplorer.lua:143` | GET of UI asset PNGs from the VexExplorer `Assets` folder |
| `backup/obsidian/Library.lua:10` | GET of Obsidian UI asset PNGs (written to disk, loaded with `getcustomasset`) |
| `KnifeDuels.lua:3`, `backup/HttpSpy.lua:2` | attribution/credit comments (`wearedevs.net`, `github.com/NotDSF`) |
| HttpSpy itself (`HttpSpy.lua`, `HttpSpy.standalone.lua`, `backup/HttpSpy.lua`) | the spy hooks `game.HttpGet`/`game.HttpPost`; those strings are hook targets and log labels, not downloads |

`python3 tools/check.py` scans for code-load sites near network calls and fails the build if
a new one appears without an opt-in guard.

## Patches applied to the mirror

Each patch is marked with a `-- [local-patch]` comment that links back to this document.

### `backup/HttpSpy.lua` (now line 32)

Upstream downloaded `backup/Serializer.lua` from GitHub on every run. The serializer is now
resolved by (1) `require(script.Parent.Serializer)` when the two files are sibling
ModuleScripts, then (2) reading a local file from the executor workspace, then (3) the
upstream's own stub serializer with a warning. The upstream URL survives only as a comment.

### `init/loader.lua` (now line 20)

`script()` returns the relative endpoint (`GuiLoader.lua`, `ChickenFarm.lua`, ...) instead of
a URL, and `run(relativePath, url)` reads the file locally. `loaderUrl`/`baseUrl` are kept
for attribution and as the explicit opt-in fallback.

### `backup/VexExplorer.lua` (now lines 433 and 3655)

`LoadSynSaveInstance` reads a local `saveinstance.luau` before falling back to the guarded
download. `FetchVersion` no longer executes downloaded code at all: it reads a local
`VexVersion.lua` (extracting the quoted version) or uses the pinned `V1.11E`.

### `backup/obsidian/Library.lua` (now line 183)

The lucide icon module is read from a local file; the GitLab download is opt-in. When no
source is available the closure still raises, so `Icon:GetIcon` keeps returning `nil`
exactly like upstream behaviour on a failed download.

## Root `Serializer.lua` versus the vendored copy

The maintained `Serializer.lua` at the repository root is the vendored
`upstream/VexalScripts/scripts/backup/Serializer.lua` with local hardening fixes from the
earlier work on this repository. It is what `HttpSpy.lua` and the standalone build use:

| Change | Why |
| --- | --- |
| `clonefunction or function(fn) return fn end` | works without the executor global |
| `debug and debug.getinfo and ...`, `typeof or type` | works outside Roblox/executors |
| `local formatString;` forward declaration | `serializeArgs` called it before its definition, raising "attempt to call a nil value" for string arguments |
| `formatString(v)` + `config.highlighting` in `serializeArgs` | highlights only when configured and escapes strings |
| backslash escaping in `formatString` | round-trips strings containing `\\` |
| identifier check `^[_%a][_%a%d]*$` | avoids emitting invalid table keys |

The vendored copy is left byte-for-byte upstream so the diff stays reviewable; nothing in
the mirror loads it over the network any more.

## Local file conventions

Patched scripts look for files in the executor workspace (or on disk) mirroring this
repository:

```
<root>/upstream/VexalScripts/scripts/...      GuiLoader.lua, endpoints, backup/Serializer.lua
<root>/upstream/VexalScripts/deps/...         saveinstance.luau, lucide-roblox/source.lua,
                                              VexExplorer/VexVersion.lua
```

`<root>` defaults to `HttpSpy` and can be changed with `getgenv().HttpSpyLocalRoot`
(`getgenv().VexalScriptsLocalRoot` for the loader). Scripts also try shorter paths such as
`backup/Serializer.lua` or `deps/saveinstance.luau`, so a loose copy still resolves.

Opt-in flags (all default to `false`):

| Flag | Restores |
| --- | --- |
| `getgenv().VexalScriptsAllowRemote` | loader downloading `GuiLoader.lua` / game scripts |
| `getgenv().VexExplorerAllowRemote` | VexExplorer downloading `saveinstance.luau` |
| `getgenv().ObsidianAllowRemoteCode` | Obsidian downloading the lucide icon source |

`python3 tools/fetch_local_deps.py` downloads the optional third-party modules into
`upstream/VexalScripts/deps/` (git-ignored, see the README there).

## Not localized

* **Obfuscated payloads** - `ChickenFarm.lua`, `DeagleArena.lua`, `DuelsMurderVsSheriff.lua`,
  `MurderVsSheriffDuels.lua`, `backup/SanityChecks.lua` (ironbrew) and `KnifeDuels.lua`
  (wearedevs) contain no literal URLs, but they are virtual-machine payloads: their real
  behaviour, including any network use, cannot be inspected or rewritten statically. They
  are copied unchanged and should be treated as untrusted.
* **Third-party modules that are not committed** - `saveinstance.luau`
  (`luau/UniversalSynSaveInstance`, no standard licence), the lucide icon source
  (`gitlab.com/upio/lucide-roblox-direct`, unreachable from the environment used to prepare
  this mirror) and `VexVersion.lua` (`Vezise/2026`, no licence). See
  `upstream/VexalScripts/deps/README.md`.
* **Network services and assets** - the `api.lua.expert/decompile` endpoint and the UI asset
  PNGs are data, not code, and are left as normal HTTP behaviour.
* **Executor APIs** - everything here still needs an executor (`hookmetamethod`,
  `hookfunction`, `readfile`, `loadstring`, `request`/`syn`). Nothing can be made local
  inside Roblox Studio's sandbox.

## Verification

```
python3 tools/build_standalone.py --check   # standalone build is in sync with the modules
python3 tools/check.py                      # structure, manifest, remote-load audit, URLs
python3 tools/check.py --fetch-upstream     # same, plus re-download upstream and compare
cd tests && npm install && node run_checks.mjs   # Luau compile + runtime checks
```

Runtime checks cover the serializer, the standalone build and the two patched mirror scripts
(`backup/HttpSpy.lua`, `init/loader.lua`) inside the stub environment in
`tests/roblox_stub.luau`. The GUI, the hooking behaviour and the large vendored scripts
require a real Roblox session and a specific executor, so they are syntax-checked only.
