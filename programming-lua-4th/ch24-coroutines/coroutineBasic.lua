print("coroutine.resume return value")
do
	local co = coroutine.create(function (a, b)
		print(a, b, "before yield")
		coroutine.yield(a * b, a / b)
		print(a, b, "after yield lol")
	end)

	print(coroutine.resume(co, 45, 9))
	print(coroutine.resume(co, 45, 9))
	print(coroutine.resume(co, 45, 9))
end

print(string.rep("==", 20))
print(string.rep("**", 20))
print(string.rep("==", 20))

print("coroutine.yield return value")
do
	local co = coroutine.create(function (a, b)
		print(a, b, "before yield")
		print(coroutine.yield())
		print(a, b, "after yield lol")
	end)
	print("first call resume")
	coroutine.resume(co, 45, 9)
	print("second call resume")
	coroutine.resume(co, 45, 9)
	print("third call resume")
	coroutine.resume(co, 45, 9)
end
-- Finally, when a coroutine ends, any values returned by its main function go to the corresponding resume:
--
co = coroutine.create(function ()
	return 6, 7
end)
print(coroutine.resume(co)) --> true 6 7
