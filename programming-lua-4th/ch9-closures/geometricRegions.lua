function disk (cx, cy, r)
	return function (x, y)
		return (x-cx)^2 + (y-cy)^2 <= r^2
	end
end

function rect (left, right, bottom, up)
	return function(x, y)
		return left <= x and x <= right and
		bottom <= y and y <= up
	end
end

function complement(r)
	return function (x,y)
		return not r(x, y)
	end
end

function union (r1, r2)
	return function(x, y)
		return r1(x,y) or r2(x,y)
	end
end

function intersection (r1, r2)
	return function(x, y)
		return r1(x,y) and r2(x,y)
	end
end

function difference (r1, r2)
	return function(x, y)
		return r1(x,y) and not r2(x,y)
	end
end

function translate (r, dx, dy)
	return function(x, y)
		return r(x-dx, y-dy)
	end
end

function plotPBM (r, width, height)
	io.write("P1\n", width, " ", height, "\n")
	for i= 1, height do
		local y = (height - i *2) /height
		for j = 1, width do
			local x = (j*2 -width)/width
			io.write(r(x, y) and "1" or "0"," ")
		end
		io.write("\n")
	end
end

io.output("region.pbm")
circle = disk(0,0,0.8)
r =  rect(-0.5,0.3,-0.2,0.7)
plotPBM(difference(circle, r), 30, 30)
