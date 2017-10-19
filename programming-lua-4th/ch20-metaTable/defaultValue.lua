function setDefault (t, d)
	local mt = { __index = function () return d end}
	setmetatable(t, mt)
end

t = { x =2, y =5}
print(t.x, t.y, t.z)
setDefault(t, 998)
print(t.x, t.y, t.z)


-- a single metatable fo r all tables
local key  = {}
local mt = { __index = function(t) return t[key] end}
function setdefault (t, d)
	t[key] = d
	setmetatable(t, mt)
end

