function newObject (value)
	return function (action, v)
		if action == "get" then
			return value
		elseif action == "set" then
			value = v
		else
			error("invalid action")
		end
	end
end

s = newObject("lol")
print(s("get"))
s("set", 998)
print(s("get"))
s("lol")
