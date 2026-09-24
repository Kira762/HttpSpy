# HttpSpy

Roblox/Luau HTTP request spy with a local serializer. The source modules are `HttpSpy.lua` and `Serializer.lua`; `HttpSpy.lua` uses `require(script.Parent.Serializer)` when both are sibling ModuleScripts.

## Raw loadstring (executor)

The standalone build embeds the serializer, so it does **not** need a second download or a `script.Parent` ModuleScript:

```lua
local HttpSpy = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kira762/HttpSpy/refs/heads/arena/01a0d172-httpspy/HttpSpy.standalone.lua"))()
```

This branch URL works after the branch has been pushed to GitHub. If you merge the branch into `main`, change `refs/heads/arena/01a0d172-httpspy` to `refs/heads/main`. To regenerate the standalone file after changing either source module, run `python3 tools/build_standalone.py`.

## Local ModuleScripts

Place `HttpSpy.lua` and `Serializer.lua` as sibling ModuleScripts named `HttpSpy` and `Serializer`:

```lua
local HttpSpy = require(script.Parent.HttpSpy)
```

The spy uses executor-specific APIs such as `hookmetamethod`, `hookfunction`, `newcclosure`, `getnamecallmethod`, and `syn` or `http`. It will not run in ordinary Roblox Studio without those APIs. Saving logs also needs executor file APIs. Only inspect traffic in environments where you are authorized to do so.

The script accepts an options table as its first argument when run via `loadstring`; ModuleScript `require` uses its built-in defaults. Edit those defaults in `HttpSpy.lua` before rebuilding if needed.

Source attribution: the initial scripts were obtained from `VexalScripts/scripts/backup/HttpSpy.lua` and `VexalScripts/scripts/backup/Serializer.lua`.
