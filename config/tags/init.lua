local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')

-- local icons = require('theme.icons')

local tags = {
	{
		-- icon = '/home/jim/.config/awesome/widget/launcher-default/icons/gitlab-icon.svg',
		name = "w",
		type = 'terminal',
		defaultApp = 'kitty',
		screen = 1
	},
	{
		-- icon = icons.web_browser,
		name = "w",
		type = 'browser',
		defaultApp = 'firefox',
		screen = 1
	},
	{
		-- icon = icons.text_editor,
		name = "w",
		type = 'code',
		defaultApp = 'subl3',
		screen = 1
	},
	{
		-- icon = icons.file_manager,
		name = "w",
		type = 'files',
		defaultApp = 'nemo',
		screen = 1
	},
	{
		-- icon = icons.multimedia,
		name = "w",
		type = 'music',
		defaultApp = 'vlc',
		screen = 1
	},
	{
		-- icon = icons.development,
		name = "w",
		type = 'any',
		defaultApp = '',
		screen = 1
	},
	--
	-- Screan 2
	--
	{
	--   icon = icons.social,
		name = 'discord',
	  	type = 'discord',
	  	defaultApp = 'discord',
	  	screen = 2,
	  	layout = awful.layout.suit.corner.se
	},
	{
	--   icon = icons.social,
		name = 'code',
	  	type = 'code',
	  	defaultApp = 'code',
	  	screen = 2,
	  	layout = awful.layout.suit.corner.se
	},
	{
	--   icon = icons.social,
		name = 'terminal',
	  	type = 'terminal',
	  	defaultApp = defaultApp.terminal,
	  	screen = 2,
	  	layout = awful.layout.suit.corner.se
	},
	{
	--   icon = icons.social,
		name = 'annything',
	  	type = 'annything',
	  	defaultApp = 'rofi',
	  	screen = 2,
	  	layout = awful.layout.suit.corner.se
	},
	{
	--   icon = icons.social,
		name = 'signal-desktop',
	  	type = 'signal-desktop',
	  	defaultApp = 'signal-desktop',
	  	screen = 2,
	  	layout = awful.layout.suit.corner.se
	},
	{
	--   icon = icons.social,
		name = 'telegram-desktop',
	  	type = 'telegram-desktop',
	  	defaultApp = 'telegram-desktop',
	  	screen = 2,
	  	layout = awful.layout.suit.corner.se
	}
}


awful.screen.connect_for_each_screen(
  function(s)
	-- if you have more screens, tan you need to add heare some trues.
	-- if you know a beatherway pleas contact me
	local selected = {true,true,true,true,true,true}
	for i, tag in ipairs(tags) do
		-- checks if there are as many screens as I defined top in the tags. 
		-- If not this tag will added to the last screen
		local msc = (screen:count() >= tag.screen and tag.screen or screen:count())
			if s == screen[msc] then
				awful.tag.add(
					tag.type, 
					{
					icon 				= tag.icon,
					icon_only 			= (tag.icon and true or false),
					layout 				= (tag.layout and tag.layout or awful.layout.layouts[1]), -- tenaer operator (x?a:b)
					gap_single_client	= false,
					gap 				= 4,
					screen 				= msc,
					defaultApp 			= tag.defaultApp,
					selected 			= selected[msc]
					}
				)
			end
			selected[tag.screen] = false
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
