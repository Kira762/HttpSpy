local label = __label or "spy"
local expectLocalReads = __expectLocalReads == true
local expectApiTable = __expectApiTable ~= false
local failures = 0

local function check(name, ok, detail)
    if ok then
        print("CHECK ok   " .. name)
    else
        failures = failures + 1
        print("CHECK FAIL " .. name .. " :: " .. tostring(detail))
    end
end

local api = type(__result) == "table" and __result or {}
if expectApiTable then
    check(label .. ": loads without error", __ok == true and type(__result) == "table", __result)
    local expectedApi = {
        "HookSynRequest", "ProxyHost", "RemoveProxy", "UnHookSynRequest",
        "BlockUrl", "WhitelistUrl", "ToggleGui", "SetGuiPosition", "SetGuiSize",
        "RenameLogFile", "GetLogFileName", "SaveLogs", "SetSaveMode",
    }
    for _, name in ipairs(expectedApi) do
        check(label .. ": API exposes " .. name, type(api[name]) == "function", tostring(api[name]))
    end
    check(label .. ": API exposes OnRequest", api.OnRequest ~= nil, tostring(api.OnRequest))
else
    check(label .. ": loads without error", __ok == true, __result)
end

check(label .. ": nothing was downloaded during load", #__genv.__refused == 0,
    table.concat(__genv.__refused, ", "))

if expectLocalReads then
    local serializerRead = nil
    for _, path in ipairs(__genv.__reads) do
        if tostring(path):find("Serializer.lua", 1, true) then
            serializerRead = path
            break
        end
    end
    check(label .. ": serializer was read from a local file", serializerRead ~= nil,
        table.concat(__genv.__reads, ", "))
else
    check(label .. ": no file reads (serializer is embedded)", #__genv.__reads == 0,
        table.concat(__genv.__reads, ", "))
end

local logWrites = {}
for _, entry in ipairs(__genv.__fileWrites) do
    if type(entry.path) == "string" and entry.path:match("^HttpSpy_%d+_%d+%.txt$") then
        logWrites[#logWrites + 1] = entry
    end
end
check(label .. ": log file is initialised as HttpSpy_<mmss>_<random>.txt", #logWrites > 0, #__genv.__fileWrites)

if expectApiTable then
local apiCallsOk = true
local apiCallError = nil
for _, call in ipairs({
    function() api:BlockUrl("https://example.com/blocked") end,
    function() api:WhitelistUrl("https://example.com/blocked") end,
    function() api:HookSynRequest("https://example.com/hook", function(response) return response end) end,
    function() api:UnHookSynRequest("https://example.com/hook") end,
    function() api:ProxyHost("example.com", "127.0.0.1") end,
    function() api:RemoveProxy("example.com") end,
    function() api:ToggleGui(true) end,
    function() api:SetGuiPosition(UDim2.new(0, 0, 0, 0)) end,
    function() api:SetGuiSize(UDim2.new(0, 100, 0, 100)) end,
    function() api:RenameLogFile("my_session") end,
    function() local _ = api:GetLogFileName() end,
    function() api:SaveLogs() end,
    function() api:SetSaveMode("auto") end,
}) do
    local ok, err = pcall(call)
    if not ok then
        apiCallsOk = false
        apiCallError = err
        break
    end
end
check(label .. ": public API methods run without error", apiCallsOk, apiCallError)

local renamedWrite = nil
for _, entry in ipairs(__genv.__fileWrites) do
    if type(entry.path) == "string" and entry.path:match("^my_session%.txt$") then
        renamedWrite = entry
        break
    end
end
check(label .. ": RenameLogFile writes the new log file", renamedWrite ~= nil, #__genv.__fileWrites)
check(label .. ": GetLogFileName reports the renamed file",
    type(api.GetLogFileName) == "function" and api:GetLogFileName() == "my_session.txt",
    tostring(api:GetLogFileName()))
end

local requestHook = nil
for _, hook in ipairs(__genv.__hooks) do
    if hook.original == http.request and type(hook.replacement) == "function" then
        requestHook = hook.replacement
        break
    end
end
check(label .. ": request hook was installed on http.request", requestHook ~= nil, #__genv.__hooks)
if requestHook then
    pcall(requestHook, { Url = "https://example.com/api", Method = "GET", Headers = {} })
    local found = nil
    for _, entry in ipairs(__genv.__fileWrites) do
        local data = entry.data
        if type(data) == "string" and data:find("https://example.com/api", 1, true) then
            found = data
            break
        end
    end
    check(label .. ": captured request is logged through the serializer",
        found ~= nil and found:find(".request(", 1, true) ~= nil, found)

    local responseLog = nil
    for _, entry in ipairs(__genv.__fileWrites) do
        if type(entry.data) == "string" and entry.data:find("Response Data", 1, true) then
            responseLog = entry.data
        end
    end
    check(label .. ": response is logged", responseLog ~= nil, nil)
    check(label .. ": JSON response body is auto-decoded with lowercase headers",
        responseLog ~= nil and responseLog:find("decoded = true", 1, true) ~= nil,
        responseLog and responseLog:sub(1, 240))
end

if failures > 0 then
    error(label .. " checks failed: " .. tostring(failures))
end
print("CHECK summary " .. label .. " failures=" .. tostring(failures))
