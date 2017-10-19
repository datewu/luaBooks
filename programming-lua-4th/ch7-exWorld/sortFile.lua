local lines = {}

for l in io.lines() do
	lines[#lines +1 ] =l
end

table.sort(lines)

for _, l in ipairs(lines) do
	io.write(l, "\n")
end
