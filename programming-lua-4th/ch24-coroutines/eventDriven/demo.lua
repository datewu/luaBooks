-- traditional I/O
--
--[[
do
	local t = {}
	io.output("out.txt")

	for l in io.lines() do
		t[#t + 1] = l
	end

	for i = #t, 1, - 1 do
		io.write(t[i], "\n")
	end
end



--  typical event-drive scenario
--
--
--
do
	local lib = require "async-lib"
	local t = {}
	local inp = io.input()
	local out = io.open("event-out.txt", "w")

	local i
	local function putline()
		i = i - 1
		if i == 0 then
			lib.stop()
		else
			lib.writeline(out, t[i] .. "\n", putline)
		end
	end
	local function getline (line)
		if line then
			t[#t + 1 ] = line
			lib.readline(inp, getline)
		else
			i = #t + 1
			putline() -- start the write loop
		end
	end

	lib.readline(inp, getline)
	lib.runloop()
end

--[[
--
--As is typical in an event-driven scenario, all our loops are gone, because the main loop is in the library.
--They got replaced by recursive calls disguised as events. We could improve things by using closures in
--a continuation-passing style, but we still could not write our own loops; we would have to rewrite them
--through recursion
--
--]]
--
-- coroutines 
do 
	local lib = require "async-lib"
	function run (code)
		local co = coroutine.wrap(function ()
			code()
			lib.stop()
		end)

		co()  -- resume/start coroutine
		lib.runloop()
	end

	function putline (stream, line)
		local co = coroutine.running()  -- calling coroutine
		local callback = (function () coroutine.resume(co) end)
		lib.writeline(stream, line, callback)
		coroutine.yield()
	end

	function getline (stream, line)
		local co = coroutine.running()
		local callback = (function (l) coroutine.resume(co, l) end)
		lib.readline(stream, callback)
		local line = coroutine.yield()
		return line
	end

	run (function ()
		local t = {}
		local inp = io.input()
		local out = io.open("coroutines.txt", "w")
		
		while true do
			local line = getline(inp)
			if not line then break end
			t[#t +1] = line
		end

		for i = #t, 1, -1 do
			putline(out, t[i] .. "\n")
		end
	end)

end
