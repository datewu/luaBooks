function producer ()
	while true do
		local x = io.read()
		send(x)
	end
end

function consumer(p)
	while true do
		local x = receive(p)
		io.write(x, "\n")
	end
end

function receive (prod)
	local status, value = coroutine.resume(prod)
	return value
end

function send (x)
	coroutine.yield(x)
end

producer = coroutine.create(producer)

function filter(prod)
	return coroutine.create(function ()
		for line = 1, math.huge do
			local x = receive(prod)
			x = string.format("%5d %s", line, x)
			send(x)
		end
	end)
end

consumer(filter(producer))
