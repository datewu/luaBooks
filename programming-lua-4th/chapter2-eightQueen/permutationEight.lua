N = 8 -- board size
count = 0
-- check whether position (nthQueen, column) is free from attacks
function check (a)
	for i=1, N do
		for j = i +1, N do
			if (a[i] - i == a[j] -j) or
			(a[i] +i == a[j] + j) then -- same diagonal
			return false
		end
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
function permutateQueen(a ,i)
	if i == N +1  then
		if check(a) then
			count = count +1
			printSolution(a)
		end
		return
	end

	for j=i, N do
		swap(a, i, j)
		permutateQueen(a, i+1)
		swap(a, i, j)
	end
end

function swap(a, i, j) 
	if i ~= j then
		a[i], a[j] = a[j], a[i]
	end
end

board = { 1, 2,3,4,5,6,7,8}
permutateQueen(board, 1)
print(count)
