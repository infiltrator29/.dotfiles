---------------------------------------
-- WM: Awesomewm		     --
-- Module: Dmenu task list           -- 
-- by Jacek Dziekonski (infiltrator) --
---------------------------------------

local awful = require("awful")

local t = {}

-- {{{ Main
function t.get_tasks()
	-- Get current tags (table of tags)
	local tags = awful.screen.focused().selected_tags
	-- Create a client list 
	local clients = "" 
	for _, i in ipairs(tags) do
		for num, j in ipairs(i:clients()) do
			local id = j.window
			-- Get name of the each client
			awful.spawn.easy_async_with_shell("xprop -id " .. id .. " | grep ^WM_NAME | sed 's/^.*.=.//'", function(stdout)
				awful.spawn.with_shell("xterm -hold -e echo \"" .. stdout .. "\"")
			end)

		end
	end

end

-- }}}

return t
