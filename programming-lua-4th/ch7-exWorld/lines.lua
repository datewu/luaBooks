--[[
local count = 0
for l in io.lines() do
	count = count +1
	io.write(string.format("%6d ", count), l, "\n")
end
]]

for count =1, math.huge do
	local l = io.read("L")
	if l == nil then
		break
	end
	io.write(string.format("%6d ", count), l)
end
