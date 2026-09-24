-- Minimal Rojo-free Roblox/executor stub used by tests/run_checks.mjs.
--
-- The standalone build is executed inside this environment by the Luau WebAssembly
-- runtime (see tests/run_checks.mjs). It is deliberately strict: network downloads are
-- refused so a regression that reintroduces remote code loading fails the checks.
--
-- This file is test scaffolding only; it is not shipped to Roblox and it is not a
-- faithful Roblox implementation - it only provides the globals the spy touches.

local __writes = {}    -- recorded writefile/appendfile calls
local __hooks = {}     -- recorded hookfunction/hookmetamethod calls
local __captured = {}  -- closures the spy installed via replaceclosure
local __refused = {}   -- network/file reads the spy attempted (must stay empty)
local __reads = {}     -- files served from the virtual filesystem below

-- The runner may define __virtualFiles = { ["path"] = "contents" } before this stub to
-- emulate files an executor would have in its workspace folder.
local function hasVirtualFile(path)
    return type(__virtualFiles) == "table" and __virtualFiles[path] ~= nil
end

-- Every Instance/Enum/UDim2/... value is a permissive proxy: reads return another
-- proxy, writes are stored, calls return a proxy.
local function proxy(name)
    local store = {}
    return setmetatable(store, {
        __index = function(_, key)
            local value = proxy(name .. "." .. tostring(key))
            rawset(store, key, value)
            return value
        end,
        __newindex = function(_, key, value)
            rawset(store, key, value)
        end,
        __call = function()
            return proxy(name .. "()")
        end,
        __tostring = function()
            return "proxy<" .. name .. ">"
        end,
        __add = function() return proxy(name .. "+") end,
        __sub = function() return proxy(name .. "-") end,
        __lt = function() return false end,
        __le = function() return false end,
        __eq = function(a, b) return rawequal(a, b) end,
    })
end

local function newNamespace(name)
    return setmetatable({}, { __index = function(_, key) return proxy(name .. "." .. tostring(key)) end })
end

Enum = newNamespace("Enum")
UDim = newNamespace("UDim")
UDim2 = newNamespace("UDim2")
Color3 = newNamespace("Color3")
ColorSequence = newNamespace("ColorSequence")
ColorSequenceKeypoint = newNamespace("ColorSequenceKeypoint")
NumberSequence = newNamespace("NumberSequence")
NumberSequenceKeypoint = newNamespace("NumberSequenceKeypoint")
Vector2 = newNamespace("Vector2")
Vector3 = newNamespace("Vector3")
TweenInfo = newNamespace("TweenInfo")

task = {
    spawn = function(fn, ...) return fn(...) end,
    wait = function() return 0 end,
    delay = function(_, fn, ...) if fn then fn(...) end end,
    defer = function(fn, ...) if fn then fn(...) end end,
}

Instance = {
    new = function(className)
        local instance = proxy("Instance.new(" .. tostring(className) .. ")")
        instance.ClassName = className
        return instance
    end,
}

game = proxy("game")
game.GetFullName = function() return "StubGame" end
game.GetService = function(_, serviceName) return proxy("service:" .. tostring(serviceName)) end
game.HttpService = { JSONDecode = function(_, body) return { decoded = body } end, JSONEncode = function(_, value) return "{}" end }
game.HttpGet = function(_, url)
    __refused[#__refused + 1] = "HttpGet " .. tostring(url)
    error("offline test: HttpGet refused for " .. tostring(url), 0)
end
game.HttpPost = function(_, url)
    __refused[#__refused + 1] = "HttpPost " .. tostring(url)
    error("offline test: HttpPost refused for " .. tostring(url), 0)
end

writefile = function(path, data) __writes[#__writes + 1] = { path = path, data = data, append = false } end
appendfile = function(path, data) __writes[#__writes + 1] = { path = path, data = data, append = true } end
isfile = function(path) return hasVirtualFile(path) end
readfile = function(path)
    if hasVirtualFile(path) then
        __reads[#__reads + 1] = path
        return __virtualFiles[path]
    end
    __refused[#__refused + 1] = "readfile " .. tostring(path)
    error("offline test: readfile refused for " .. tostring(path), 0)
end
isfolder = function() return false end
makefolder = function() end
delfile = function() end
listfiles = function() return {} end
setclipboard = function() end

hookfunction = function(original, replacement)
    __hooks[#__hooks + 1] = { original = original, replacement = replacement }
    return original
end
hookmetamethod = function(_, _, replacement)
    __hooks[#__hooks + 1] = { original = nil, replacement = replacement }
    return function() end
end
newcclosure = function(fn) return fn end
clonefunction = function(fn) return fn end
replaceclosure = function(fn)
    __captured[#__captured + 1] = fn
    return fn
end
getnamecallmethod = function() return nil end
getgc = function() return {} end
islclosure = function() return true end
getupvalue = function() return nil end
setupvalue = function() end
getfenv = function() return {} end
setfenv = function() end
getgenv = function() return __genv end
getreg = function() return {} end
checkcaller = function() return false end
getrawmetatable = function() return {} end
setreadonly = function() end
isreadonly = function() return false end

__genv = { __fileWrites = __writes, __captured = __captured, __refused = __refused, __hooks = __hooks, __reads = __reads }
warn = print

syn = nil
http = {
    request = function(requestTable)
        return {
            StatusCode = 200,
            StatusMessage = "OK",
            Body = '{"ok":true}',
            Headers = { ["Content-Type"] = "application/json" },
            Url = type(requestTable) == "table" and requestTable.Url or nil,
        }
    end,
}
request = http.request
