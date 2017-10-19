function mult (a, b)
	local c = {}
	for i = 1, #a do
		local row = {}
		for k, va in pairs(a[i]) do -- 'va' is a[i][k]
			for j, vb in pairs(b[k]) do -- 'vb' is b[k][j]
				local res = (row[j] or 0) + va * vb
				row[j] = (res ~= 0) and res or nil
			end
		end
		c[i] = row
	end
	return c
end
