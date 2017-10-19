function no(a, x)
	r = 0
	--[[ normal approach
	for i, v in ipairs(a) do
		r = r + v*x^(i-1)
	end
	--]]
	mapXn = {1}
	for i=1, #a -1 do
		table.insert(mapXn,mapXn[i]*x)
	end

	for i, v in ipairs(a) do
		r = r + v*mapXn[i]
	end
	return r
end

poly = {1,2,0,-3,4} -- 1 + 2x -3x^3 + 4x^4
print(no(poly, 2))
