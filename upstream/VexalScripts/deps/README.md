# Local dependency stubs

The vendored VexalScripts scripts used to download and execute these modules at runtime.
They now read them from this directory first (see `docs/UPSTREAM.md`):

| File | Used by | Upstream source |
| --- | --- | --- |
| `saveinstance.luau` | `backup/VexExplorer.lua` (`LoadSynSaveInstance`) | `luau/UniversalSynSaveInstance` |
| `lucide-roblox/source.lua` | `backup/obsidian/Library.lua` (icon module) | `upio/lucide-roblox-direct` (GitLab) |
| `VexExplorer/VexVersion.lua` | `backup/VexExplorer.lua` (`FetchVersion`) | `Vezise/2026` |

Run `python3 tools/fetch_local_deps.py` to download them, or copy the files here yourself.

These files are **not** committed: they are third-party code (the SynSaveInstance project
ships no standard licence and the Obsidian icon source is hosted on GitLab), and the
vendored scripts stay usable without them - the download is only attempted when you set
the script's opt-in flag (`getgenv().VexExplorerAllowRemote`,
`getgenv().ObsidianAllowRemoteCode`).

`VexExplorer/VexVersion.lua` is optional: `FetchVersion` falls back to the pinned upstream
value `V1.11E` when the file is absent.
