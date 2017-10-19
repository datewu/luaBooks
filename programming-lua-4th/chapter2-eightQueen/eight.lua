N = 8 -- board size
count = 0.0
-- check whether position (nthQueen, column) is free from attacks
function isPlaceOk (a, nth, column)
	for i=1, nth -1 do
		if (a[i] == column) or -- same column
			(a[i] - i == column -nth) or
			(a[i] +i == column +nth) then -- same diagonal
			return false
		end
	end
	return true
end

-- print a board
function printSolution(a)
	for i =1, N do
		for j=1, N do
			io.write(a[i] == j and "X" or "-", " ")
		end
		io.write("\n")
	end
	io.write("\n")
end

-- add to board 'a' all queens form 'nth' to 'N'
function addQueen(a, nth)
	if nth > N then
		print(a[N])
		count = count +1
		printSolution(a)
	else
		for column = 1, N do
			--[[ without if statement, printSolution() will be called n^n times
				a[nth] = column
				addQueen(a, nth +1)
				]] 
	--		if isPlaceOk(a, nth, column) then
				a[nth] = column
				addQueen(a, nth +1)
	--		end
		end
	end
end

-- run the program
--addQueen({}, 1)
board = {}
addQueen(board,1)
print(count)


