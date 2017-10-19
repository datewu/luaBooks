function basicSerialize (o)
	-- assum 'o' is a number or string
	return string.format("%q", o)
end

function save (name, value, saved)
	saved = saved or {}
	io.write(name, " = ")
	if type(value) == "number" or type(value) == "string" then
		io.write(basicSerialize(value), "\n")
	elseif type(value) == "table" then
		if saved[value] then
			io.write(saved[value], "\n")
		else
			saved[value] = name
			io.write("{}\n")
			for k, v in pairs(value) do
				k = basicSerialize(k)
				local fname = string.format("%s[%s]", name, k)
				save(fname, v, saved)
			end
		end
	else
		error("cannot save a " .. type(value))
	end
end

a = { x=3, y = 6, { 4,5}}
a[2] = a
a.z = a[1]

save("lol", a)
print(string.rep("=", 20))

a = {{"one", "two"}, 3, 998}
b = {k=a[1], 1024, x = "lol", y = "cf"}
local tmp = {}
save("a", a, tmp)
save("b", b, tmp)

print(string.rep("=", 20))

save("noShareA", a)
save("noShareB", b)
print(string.rep("=", 20))
