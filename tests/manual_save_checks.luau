local label = __label or "spy"
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
check(label .. ": loads without error", type(__result) == "table", __result)
check(label .. ": API exposes SaveLogs", type(api.SaveLogs) == "function", tostring(api.SaveLogs))

local requestHook = nil
for _, hook in ipairs(__genv.__hooks) do
    if hook.original == http.request and type(hook.replacement) == "function" then
        requestHook = hook.replacement
        break
    end
end
check(label .. ": request hook installed on http.request", requestHook ~= nil, #__genv.__hooks)

if requestHook then
    pcall(requestHook, { Url = "https://example.com/manual", Method = "GET", Headers = {} })
end
local wroteBefore = false
for _, entry in ipairs(__genv.__fileWrites) do
    if type(entry.data) == "string" and entry.data:find("https://example.com/manual", 1, true) then
        wroteBefore = true
        break
    end
end
check(label .. ": buffered log is NOT written before SaveLogs", wroteBefore == false, #__genv.__fileWrites)

local flushed
pcall(function() flushed = api:SaveLogs() end)
check(label .. ": SaveLogs runs without error", flushed ~= nil, tostring(flushed))

local wroteAfter = false
for _, entry in ipairs(__genv.__fileWrites) do
    if type(entry.data) == "string" and entry.data:find("https://example.com/manual", 1, true) then
        wroteAfter = true
        break
    end
end
check(label .. ": buffered log IS written after SaveLogs", wroteAfter == true, nil)

if failures > 0 then
    error(label .. " checks failed: " .. tostring(failures))
end
print("CHECK summary " .. label .. " failures=" .. tostring(failures))
