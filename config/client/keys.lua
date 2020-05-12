local awful = require('awful')
local gears = require('gears')

require('awful.autofocus')

local modkey = require('config.keys.mod').modKey
local altkey = require('config.keys.mod').altKey
local group = group


local dpi = require('beautiful').xresources.apply_dpi

local clientKeys = awful.util.table.join(
	
	-- toggle fullscreen
	awful.key(
		{modkey},
		'f',
		function(c)
			-- Toggle fullscreen
			c.fullscreen = not c.fullscreen
			c:raise()
		end,
		{description = 'toggle fullscreen', group = group}
	),
	
	-- close client
	awful.key(
		{modkey},
		'q',
		function(c)
			c:kill()
		end,
		{description = 'close', group = group}
	),
	-- Default client focus
	awful.key(
		{modkey},
		'j',
		function()
			awful.client.focus.byidx(1)
		end,
		{description = 'focus next by index', group = group}
	),
	awful.key(
		{modkey},
		'k',
		function()
			awful.client.focus.byidx(-1)
		end,
		{description = 'focus previous by index', group = group}
	),
	awful.key(
		{modkey},
		'h',
		awful.client.movetoscreen,
		{description = 'move window to next screen', group = group}
	),
	awful.key(
		{modkey},
		'l',
		awful.client.movetoscreen,
		{description = 'move window to next screen', group = group}
	),
	awful.key(
		{modkey, 'Shift'}, 
		'h',      
		function (c) 
			c:move_to_screen()
		end,
		{description = "move to screen", group = group}
	),
	awful.key(
		{modkey, 'Shift'}, 
		'l',      
		function (c) 
			c:move_to_screen()
		end,
		{description = "move to screen", group = group}
	),
	awful.key(
		{modkey, altkey},
		'h',
		function(c)
			if c.floating then
				c:relative_move(dpi(10), 0, 0, 0)
			end
		end,
		{description = 'move floating client up by 10 px', group = group}
	),
	awful.key(
		{modkey, altkey},
		'j',
		function(c)
			if c.floating then
				c:relative_move(0, dpi(10), 0, 0)
			end
		end,
		{description = 'move floating client up by 10 px', group = group}
	),
	awful.key(
		{modkey, altkey},
		'k',
		function(c)
			if c.floating then
				c:relative_move(0, 0, dpi(10), 0)
			end
		end,
		{description = 'move floating client up by 10 px', group = group}
	),
	awful.key(
		{modkey, altkey},
		'l',
		function(c)
			if c.floating then
				c:relative_move(0, 0, 0, dpi(10))
			end
		end,
		{description = 'move floating client up by 10 px', group = group}
	),








	awful.key(
		{modkey}, 
		'u', 
		awful.client.urgent.jumpto, 
		{description = 'jump to urgent client', group = group}
	),
	awful.key(
		{modkey},
		'Tab',
		function()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
		{description = 'go back', group = group}
	),
	
	-- toggle client floating mode
	awful.key(
		{modkey},
		'c',
		function(c)
			c.fullscreen = false
			c.maximized = false
			c.floating = not c.floating
			c:raise()
		end,
		{description = 'toggle floating', group = group}
	),
	awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
	{description = "move to master", group = group})
)

return clientKeys