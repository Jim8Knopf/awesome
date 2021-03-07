local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local defaultApp = require('config.apps')

local icons = require('theme.icons')

_G.screens = {1}
-- checks if there are as many screens as I want to have.
-- in this case 2. for a third screen just change the 2 into a 3 an soon.
-- If not this tag will added to the last screen
_G.screens[2] = (screen:count() >= 2 and 2 or screen:count())

local tags = {
	{
		icon = icons.terminal,
		name = 'terminal',
		type = 'terminal',
		defaultApp = 'kitty',
		screen = _G.screens[1]
	},
	{
		icon = icons.browser,
		name = 'browser',
		type = 'browser',
		defaultApp = 'firefox',
		screen = _G.screens[1]
	},
	{
		-- icon = icons.text_editor,
		name = 'code',
		type = 'code',
		defaultApp = 'subl3',
		screen = _G.screens[1]
	},
	{
		-- icon = icons.file_manager,
		name = 'files',
		type = 'files',
		defaultApp = 'nemo',
		screen = _G.screens[1]
	},
	{
		-- icon = icons.multimedia,
		name = 'music',
		type = 'music',
		defaultApp = 'vlc',
		screen = _G.screens[1]
	},
	{
		-- icon = icons.development,
		name = 'any',
		type = 'any',
		defaultApp = '',
		screen = _G.screens[1]
	},
	--
	-- Screan 2
	--
	{
	  	icon = icons.discord,
		name = 'discord',
	  	type = 'discord',
	  	defaultApp = 'discord',
	  	screen = _G.screens[2],
	  	layout = awful.layout.suit.tile.bottom
	},
	{
	--   icon = icons.social,
		name = 'code',
	  	type = 'code',
	  	defaultApp = 'code',
	  	screen = _G.screens[2],
	  	layout = awful.layout.suit.tile.bottom
	},
	{
	  	icon = icons.terminal,
		name = 'terminal',
	  	type = 'terminal',
	  	defaultApp = defaultApp.terminal,
	  	screen = _G.screens[2],
	  	layout = awful.layout.suit.tile.bottom
	},
	{
	--   icon = icons.social,
		name = 'any',
	  	type = 'any',
	  	defaultApp = 'rofi',
	  	screen = _G.screens[2],
	  	layout = awful.layout.suit.tile.bottom
	},
	{
	  	icon = icons.signal,
		name = 'signal',
	  	type = 'signal',
	  	defaultApp = 'signal-desktop',
	  	screen = _G.screens[2],
	  	layout = awful.layout.suit.tile.bottom
	},
	{
	  	icon = icons.mail,
		name = 'thunderbird',
	  	type = 'thunderbird',
	  	defaultApp = 'thunderbird',
	  	screen = _G.screens[2],
	  	layout = awful.layout.suit.tile.bottom
	},
	{
	  	icon = icons.telegram,
		name = 'telegram',
	  	type = 'telegram',
	  	defaultApp = 'telegram-desktop',
	  	screen = _G.screens[2],
	  	layout = awful.layout.suit.tile.bottom
	}
}


awful.screen.connect_for_each_screen(
  	function(s)
		-- if you have more screens, tan you need to add heare some trues.
		-- if you know a beatherway pleas contact me
		local selected = {true,true,true,true,true,true}
		if _G.screens[s.index] then
			for i, tag in ipairs(tags) do
				-- checks on wich screen wich tag has to go
				if tag.screen then -- ???
					if s == screen[tag.screen] then
						awful.tag.add(
							tag.type, 
							{
								name				= tag.name,
								icon 				= tag.icon,
								icon_only 			= (tag.icon and true or false),
								layout 				= (tag.layout and tag.layout or awful.layout.layouts[1]), -- tenaer operator (x?a:b)
								gap_single_client	= false,
								gap 				= 4,
								screen 				= tag.screen,
								defaultApp 			= tag.defaultApp,
								selected 			= selected[tag.screen]
							}
						)
					end
					selected[tag.screen] = false
				end
			end
		else
    		-- Each screen has its own tag table.
		    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
		end
  	end
)


tag.connect_signal(
	'property::layout',
	function(t)
		local currentLayout = awful.tag.getproperty(t, 'layout')
		if (currentLayout == awful.layout.suit.max) then
			t.gap = 0
		else
			t.gap = beautiful.useless_gap
		end
	end
)
