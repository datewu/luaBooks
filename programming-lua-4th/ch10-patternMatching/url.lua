-- encode
function escape (s)
	s = string.gsub(s, "[%%&=+%c]", function (c)
		return string.format("%%%02X", string.byte(c))
	end)
	s = string.gsub(s, " ", "+")
	return s
end

function encode (t)
	local b = {}
	for k, v in pairs (t) do
		b[#b+1] = (escape(k).."="..escape(v))
	end
	return table.concat(b, "&")
end


-- decode
function unescape(s)
	s = string.gsub(s, "+", " ")
	s = string.gsub(s, "%%(%x%x)", function (hex)
		return string.char(tonumber(hex, 16))
	end)
	return s
end

cgi = {}
function decode (s)
	for name, value in string.gmatch(s, "([^&=]+)=([^&=]+)") do
		name = unescape(name)
		value = unescape(value)
		cgi[name] = value
	end
end

