-- Assertions for a HttpSpy build (HttpSpy.standalone.lua or the vendored copy) after it
-- has been executed inside tests/roblox_stub.luau by tests/run_checks.mjs.
--
-- In scope:
--   __ok                  - true when the file loaded without error
--   __result              - the API table the file returned (or the error message)
--   __label               - name used in the CHECK lines
--   __expectLocalReads    - true when the serializer must come from a local file
--   __genv.__fileWrites / __genv.__captured / __genv.__refused / __genv.__reads

local label = __label or "spy"
local expectLocalReads = __expectLocalReads == true
-- The standalone build returns its API table; the vendored upstream copy does not (it only
-- exposes it through getgenv while hooked), so API surface checks are opt-out.
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
    }
    for _, name in ipairs(expectedApi) do
        check(label .. ": API exposes " .. name, type(api[name]) == "function", tostring(api[name]))
    end
    check(label .. ": API exposes OnRequest", api.OnRequest ~= nil, tostring(api.OnRequest))
else
    check(label .. ": loads without error", __ok == true, __result)
end

-- The spy must not download anything while loading: the stub refuses those calls.
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

-- A log file must be initialised (SaveLogs defaults to true) with the upstream name pattern.
local logWrites = {}
for _, entry in ipairs(__genv.__fileWrites) do
    if type(entry.path) == "string" and entry.path:match("^HttpSpy_%d+_%d+%.txt$") then
        logWrites[#logWrites + 1] = entry
    end
end
check(label .. ": log file is initialised as HttpSpy_<mmss>_<random>.txt", #logWrites > 0, #__genv.__fileWrites)

-- Exercise the API surface the same way a user script would.
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
}) do
    local ok, err = pcall(call)
    if not ok then
        apiCallsOk = false
        apiCallError = err
        break
    end
end
check(label .. ": public API methods run without error", apiCallsOk, apiCallError)
end

-- The embedded serializer must format a real request log line. The stub records every
-- hookfunction() call, so the request wrapper HttpSpy installed on http.request can be
-- invoked directly.
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
end

if failures > 0 then
    error(label .. " checks failed: " .. tostring(failures))
end
print("CHECK summary " .. label .. " failures=" .. tostring(failures))
