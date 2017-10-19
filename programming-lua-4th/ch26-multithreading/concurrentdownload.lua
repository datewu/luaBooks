socket = require "socket"
function download (host, file)
	local c =  assert(socket.connect(host, 80))
	local count = 0 -- counts number of bytes read
	local request = string.format(
	"GET %s HTTP/1.0\r\nhost: %s\r\n\r\n", file, host)
	
	c:send(request)
	while true do
		local s, status = receive(c)
		count = count + #s
		if status == "closed" then break end
	end
	c:close()
	print(file, count)
end

function receive(connection)
	connection:settimeout(0) -- do not block
	local s, status, partial = connection:receive(2^10)
	if status == "timeout" then
		coroutine.yield(connection)
	end
	return s or partial, status
end


task = {}

function get (host, file)
	local co = coroutine.wrap(function ()
		download(host, file)
	end)

	table.insert(tasks, co)
end

function dispatch ()
	local i = 1
	local timeout = {}
	while true do
		if tasks[i] == nil then -- no other tasks?
			if tasks[1] == nil then -- list is empty?
				break
			end
			i = 1 -- else restart the loop
			timeout = {}
		end
		local res = tasks[i]() -- run a task
		if not res then -- task finished?
			table.remove(tasks, i)
		else -- time out
			i = i +1
			timeout[#timeout +1 ] = res
			if #timeout == #tasks then -- all tasks blocked?
				socket.select(timeout) -- wait
			end
		end
	end
end
