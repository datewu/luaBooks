do
print("origin",	math.sin(2))
 local oldSin = math.sin
 local k = math.pi / 180
 math.sin = function (x)
 return oldSin(x * k)
 end
print("new", math.sin(2))
 end

print("outter",  math.sin(2))
