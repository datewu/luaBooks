function digitButton (digit)
	return button {
		label = tostring(digit),
		action = function ()
			add_to_display(digit)
		end
	}
end

--[[
In this example, we pretend that Button is a toolkit function that creates new buttons; label is the
button label; and action is the callback function to be called when the button is pressed. The callback
can be called a long time after digitButton did its task, but it can still access the digit variable.
]]
