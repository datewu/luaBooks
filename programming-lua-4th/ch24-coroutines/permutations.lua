function genperm (a, n)
  n = n or #a
  if n <= 1 then
    printResult(a)
  else
    for i = 1, n do
      a[n], a[i] = a[i], a[n]
      genperm(a, n - 1)
      a[n], a[i] = a[i], a[n]
    end
  end
end

function printResult (a)
	for i=1, #a do
		io.write(a[i], " ")
	end
	io.write("\n")
end

genperm({1,9,7})

-- the iterator way

function iteratorPerm (a, n)
	n = n or #a
	if n <=1 then
		coroutine.yield(a)
	else
		for i = 1, n do
			a[n], a[i] = a[i], a[n]
			iteratorPerm(a, n-1)
			a[n], a[i] = a[i], a[n]
		end
	end
end

function permutations(a)
	local co = coroutine.create(function () iteratorPerm(a) end)
	return function () -- iterator
		local code, res = coroutine.resume(co)
		return res
	end
end

--[[ above coroutine.create and return fn equal to this coroutine.wrap
function permutations(a)
	return coroutine.wrap(function() iteratorPerm(a) end )
end
]]
for p in permutations{"a", "d", "x"} do
	printResult(p)
end
