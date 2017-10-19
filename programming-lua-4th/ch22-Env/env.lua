function factory (_ENV)
--	print(a)
	return function () return a end
end

f1 = factory{a = 998}
f3 = factory{a = 999}

print(f1(), f3(), f1(), f3())


function factory2 (t)
	setmetatable(t, {__index = _G })
	_ENV = t
	print(a)
	return function () return a end
end

f0 = factory2{}
f1 = factory2{a = 9}
f3 = factory2{a = 3}

f3()

--print(f0(), f1(), f3(), f1(), f3())

