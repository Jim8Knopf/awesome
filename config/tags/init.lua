local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')

-- local icons = require('theme.icons')

local tags = {
	{
		-- icon = icons.terminal,
		type = 'terminal',
		defaultApp = 'kitty',
		screen = 1
	},
	{
		-- icon = icons.web_browser,
		type = 'browser',
		defaultApp = 'firefox',
		screen = 1
	},
	{
		-- icon = icons.text_editor,
		type = 'code',
		defaultApp = 'subl3',
		screen = 1
	},
	{
		-- icon = icons.file_manager,
		type = 'files',
		defaultApp = 'nemo',
		screen = 1
	},
	{
		-- icon = icons.multimedia,
		type = 'music',
		defaultApp = 'vlc',
		screen = 1
	},
	-- {
	-- 	-- icon = icons.games,
	-- 	type = 'game',
	-- 	defaultApp = 'steam',
	-- 	screen = 1
	-- },
	-- {
	-- 	-- icon = icons.graphics,
	-- 	type = 'art',
	-- 	defaultApp = 'gimp-2.10',
	-- 	screen = 1
	-- },
	-- {
	-- 	icon = icons.sandbox,
	-- 	type = 'virtualbox',
	-- 	defaultApp = 'virtualbox',
	-- 	screen = 1
	-- },
	{
		-- icon = icons.development,
		type = 'any',
		defaultApp = '',
		screen = 1
	},
	{
	--   icon = icons.social,
	  type = 'social',
	  defaultApp = 'discord',
	  screen = 1
	}
}

-- {{{ Tag
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        awful.layout.suit.floating,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
        awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw,
    })
end)
-- }}}

awful.screen.connect_for_each_screen(
  function(s)
    for i, tag in pairs(tags) do
      awful.tag.add(
        i,
        {
          icon 				= tag.icon,
          icon_only 		= true,
          layout 			= awful.layout.suit.corner.nw,
          gap_single_client	= false,
          gap 				= 4,
          screen 			= s,
          defaultApp 		= tag.defaultApp,
          selected 			= i == 1
        }
      )
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