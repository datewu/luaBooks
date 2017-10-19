function allWords ()
	local line = io.read()  -- current line
	local post = 1 -- current position in the line
	return function() -- the iterator funciton
		while line do
			local w, e = string.match(line, "(%w+)()", pos)
			if w then
				pos = e  -- " '()' capture the position"
				return w
			else
				line = io.read()  -- word not found; try next line
				pos = 1 -- restart from the first position 
			end
		end
		return nil --  no more lines: end of traversal
	end
end

for w in allWords() do
	print(w)
end
