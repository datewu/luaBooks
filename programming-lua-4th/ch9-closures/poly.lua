function newpoly(t)
--	local r = 0  must not use this
	return function(x)
		local r = 0
		for i, v in ipairs(t) do
			r = r + v * x ^(i-1)
		end
		return r
	end
end

f = newpoly({3,0,1})
print(f(0), f(5), f(10), f(31))
