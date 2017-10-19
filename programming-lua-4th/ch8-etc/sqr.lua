function sqr(x)
	local r = x /2
	repeat
		r = (r + x/ r) /2
		local delta = math.abs(r^2 -x)
	until delta < x / 10000
	return r
end
	
io.write(sqr(2))
