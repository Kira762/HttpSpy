local label = "loader"
local failures = 0

local function check(name, ok, detail)
    if ok then
        print("CHECK ok   " .. name)
    else
        failures = failures + 1
        print("CHECK FAIL " .. name .. " :: " .. tostring(detail))
    end
end

check(label .. ": runs without error", __ok == true, __result)
check(label .. ": nothing was downloaded", #__genv.__refused == 0, table.concat(__genv.__refused, ", "))

local readGuiLoader, readEndpoint = nil, nil
for _, path in ipairs(__genv.__reads) do
    local text = tostring(path)
    if text:find("GuiLoader.lua", 1, true) then readGuiLoader = text end
    if text:find("ChickenFarm.lua", 1, true) then readEndpoint = text end
end
check(label .. ": GuiLoader.lua came from a local file", readGuiLoader ~= nil, table.concat(__genv.__reads, ", "))
check(label .. ": per-game script came from a local file", readEndpoint ~= nil, table.concat(__genv.__reads, ", "))
check(label .. ": local per-game script was executed", type(__genv.__localEndpointRan) == "number",
    tostring(__genv.__localEndpointRan))

if failures > 0 then
    error(label .. " checks failed: " .. tostring(failures))
end
print("CHECK summary " .. label .. " failures=" .. tostring(failures))
