local f = io.popen("ls /", "r")
local dir = {}
for entry in f:lines() do
	dir[#dir +1] = entry
end


local subject = 'some news'
local address = 'lol@dota.com'

local cmd = string.format("mail -s '%s' '%s'",subject, address)
local stream = io.popen(cmd, "w")
stream:write([[
Nothing important to say
-- me
]])
stream:close()
