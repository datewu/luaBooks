function readOnly(t)
	local proxy = {} -- proxy table for 't'

	-- create metatable for the proxy
	local mt = {
		__index = t,

		__newindex = function (_, k, v)
			error("attempt to update a read-only table",2)
		end,
	}
	
	setmetatable(proxy, mt)
	return proxy
end
days = readOnly{"Sunday", "Monday", "Tuesday", "Wednesday",
 "Thursday", "Friday", "Saturday"}

 print(days[3])
 
--days[3] = 'ddd'
 print(days[3])
