-- weak key
local defaults = {}
setmetatable(defaults, { __mode = "k" } )
local mt = { __index = function (t) return defaults[t] end }
function setDefault (t, d)
	defaults[t] = d
	setmetatable(t, mt)
end


-- weak value with memorize
local metas = {}
setmetatable(metas, { __mode = "v" })
function setDefault2 (t, d)
	local mt = metas[d]
	if mt == nil then
		mt = { __index = function () return d end }
		metas[d] = mt -- memorize
	end
	setmetatable(t, mt)
end
