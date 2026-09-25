local failures = 0

local function check(name, ok, detail)
    if ok then
        print("CHECK ok   " .. name)
    else
        failures = failures + 1
        print("CHECK FAIL " .. name .. " :: " .. tostring(detail))
    end
end

local function attempt(fn, ...)
    local ok, result = pcall(fn, ...)
    return ok, result
end

Serializer.UpdateConfig({ highlighting = false, spaces = 2 })

do
    local ok, result = attempt(Serializer.FormatArguments, "https://example.com/api", 200)
    check("FormatArguments formats a string argument (regression: local formatString ordering)",
        ok and result == '"https://example.com/api", 200', result)
end

do
    local ok, result = attempt(Serializer.FormatArguments, 1, true)
    check("FormatArguments formats primitive arguments", ok and result == "1, true", result)
end

do
    local ok, result = attempt(Serializer.FormatString, "a\nb\tc\"d")
    check("FormatString escapes newline, tab and quote", ok and result == 'a\\nb\\tc\\"d', result)
end

do
    local ok, result = attempt(Serializer.Serialize, { alpha = 1, beta = "two" })
    check("Serialize emits keys and string values",
        ok and result:find("alpha = 1", 1, true) ~= nil and result:find('beta = "two"', 1, true) ~= nil,
        result)
end

do
    local ok, result = attempt(Serializer.Serialize, { nested = { value = 1 } })
    check("Serialize honours the configured indent",
        ok and result:find("\n  nested = {", 1, true) ~= nil and result:find("\n    value = 1", 1, true) ~= nil,
        result)
end

do
    local ok, result = attempt(Serializer.Serialize, "not a table")
    check("Serialize rejects non-table input", not ok, result)
end

do
    local ok, result = attempt(Serializer.FormatString, 42)
    check("FormatString rejects non-string input", not ok, result)
end

do
    Serializer.UpdateConfig({ highlighting = true, spaces = 2 })
    local ok, result = attempt(Serializer.FormatArguments, "hi")
    check("highlighting wraps strings in ANSI colour", ok and result == "\27[32m\"hi\"\27[0m", result)
    Serializer.UpdateConfig({ highlighting = false, spaces = 2 })
end

if failures > 0 then
    error("serializer checks failed: " .. tostring(failures))
end
print("CHECK summary serializer failures=" .. tostring(failures))
