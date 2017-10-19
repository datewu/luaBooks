local statetab = {}

function instert (prefix, value)
	local list = statetab[prefix]
	if list == nil then
		statetab[prefix] = { value }
	else
		list[#list +1] = value
	end
end

function allWords ()
	local line = io.read()
	local pos = 1
	return function ()
		while line do
			local w, e = string.match(line, "(%w+[,;.:]?)()", pos)
			if w then
				pos = e
				return w
			else
				line = io.read()
				pos =1
			end
		end
		return nil
	end
end

function prefix (w1, w2)
	return w1 .. " " .. w2
end

local maxGEN = 200
local noWORD = "\n"

-- build table
local w1, w2 = noWORD, noWORD
for nextWord in allWords() do
	instert(prefix(w1,w2), nextWord)
	w1 = w2
	w2 = nextWord
end
instert(prefix(w1, w2),noWORD)

-- genrate text
w1, w2 = noWORD, noWORD
for i = 1, maxGEN do
	local list = statetab[prefix(w1, w2)]
	-- choose a random item from list
	local r = math.random(#list)
	local nextWord = list[r]
	if nextWord == noWORD then return end
	io.write(nextWord, " ")
	w1 = w2
	w2 = nextWord
end
