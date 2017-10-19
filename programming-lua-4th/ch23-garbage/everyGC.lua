--do
	local mt = { __gc =  function (o)
		-- whatever you want to do
		print("new cycle")
		-- creates new object for next cycle
		setmetatable({}, getmetatable(o))
	end}

	-- kick start the first object
	setmetatable({}, mt)
--end

collectgarbage()
collectgarbage()
collectgarbage()
collectgarbage()
collectgarbage()
