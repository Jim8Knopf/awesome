local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local widget = require("widget")
local top_panel = require("layout.top-panel")


-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
-- }}}


-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(
  function(s)
    -- Create the Top bar
    s.top_panel = top_panel(s)
  end
)
