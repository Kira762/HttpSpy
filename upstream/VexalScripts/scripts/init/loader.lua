local scripts = {
    ["Chicken Farm Script"] = {
        Endpoint = "ChickenFarm.lua",
        GameId = 10209534490
    },
    ["Murder vs Sheriff Duels Script"] = {
        Endpoint = "MurderVsSheriffDuels.lua",
        GameId = 4348829796
    },
    ["Duels Murder vs Sheriff Script"] = {
        Endpoint = "DuelsMurderVsSheriff.lua",
        GameId = 7219654364
    },
    ["Deagle Arena Script"] = {
        Endpoint = "DeagleArena.lua",
        GameId = 10057403337
    }
}

local loaderUrl = "https://raw.githubusercontent.com/VexalScripts/scripts/refs/heads/main/GuiLoader.lua"
local baseUrl = "https://raw.githubusercontent.com/VexalScripts/scripts/refs/heads/main/"
local localRoot = (getgenv().VexalScriptsLocalRoot or "HttpSpy") .. "/upstream/VexalScripts/scripts"
local allowRemote = getgenv().VexalScriptsAllowRemote == true

local function script()
    for scriptName, data in pairs(scripts) do
        if data.GameId == game.GameId then
            return data.Endpoint
        end
    end
    return nil
end

local function readSource(relativePath)
    if type(readfile) ~= "function" or type(isfile) ~= "function" then return nil, nil end
    for _, candidate in ipairs({
        localRoot .. "/" .. relativePath,
        "upstream/VexalScripts/scripts/" .. relativePath,
        "scripts/" .. relativePath,
        relativePath,
    }) do
        local ok, source = pcall(function()
            if isfile(candidate) then
                return readfile(candidate)
            end
            return nil
        end)
        if ok and type(source) == "string" and #source > 0 then
            return source, candidate
        end
    end
    return nil, nil
end

local function run(relativePath, url)
    if not relativePath then return end;
    local source, origin = readSource(relativePath)
    if not source and allowRemote then
        local ok, remote = pcall(function()
            return game:HttpGet(url, true)
        end)
        if ok and type(remote) == "string" and #remote > 0 then
            source, origin = remote, url
        end
    end
    if not source then
        warn(string.format(
            "[VexalScripts] no local copy of %q found (looked under %q). " ..
            "Set getgenv().VexalScriptsLocalRoot, or getgenv().VexalScriptsAllowRemote = true " ..
            "to download %q instead.", relativePath, localRoot, url))
        return
    end
    local chunk, err = loadstring(source, "@" .. tostring(origin))
    if not chunk then
        warn(string.format("[VexalScripts] could not compile %q: %s", tostring(origin), tostring(err)))
        return
    end
    chunk()
end
if not getgenv().dontRunLoader then
    run("GuiLoader.lua", loaderUrl);
end

local function notify(title, text, duration)
    task.spawn(function()
        local success = false
        while not success do
            success = pcall(function()
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = title,
                    Text = text,
                    Duration = duration or 5
                })
            end)
            if not success then task.wait(0.2) end
        end
    end)
end

local endpoint = script()
if endpoint then
    local success, placeInfo = pcall(function()
        return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    end)
    local gameName = (success and placeInfo and placeInfo.Name) or "Game"
    notify(gameName, "Welcome to Vexal Scripts! Please wait, your script is loading..", 10)
    run(endpoint, baseUrl .. endpoint)
else
    notify("Unsupported Game!", "GameId: " .. tostring(game.GameId) .. " is not supported by Vexal Scripts!", 60)
end
