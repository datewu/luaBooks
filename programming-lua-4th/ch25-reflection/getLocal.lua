function foo(a,b)
	local x 
	do
		local c = a -b
	end
	local a = 1
	while true do
		local name, value = debug.getlocal(1, a)
		if not name then break end
		print(name, value)
		a = a +1 
	end
end

function bar(a,b)
	local x 
	do
		local c = a -b
	end
	local i = 1
	while true do
		local name, value = debug.getlocal(1, i)
		if not name then break end
		print(name, value)
		i = i +1 
	end
end

foo(100, 300)
print(string.rep("=", 20))
bar(100, 300)

