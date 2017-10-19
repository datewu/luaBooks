function factory (t)
	local i = 0
	return function ()
		i = i + 1
		return t[i]
	end
end

list = { 998, 997, "kil", 'lol'}
for v in factory(list) do
	print (v)
end
	
