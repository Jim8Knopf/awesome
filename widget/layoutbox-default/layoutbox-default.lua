local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local watch = require("awful.widget.watch")
local wibox = require("wibox")



-- Create an imagebox widget which will contain an icon indicating which layout we're using.
-- We need one layoutbox per screen.
local mylayoutbox = function(s)
  local layoutbox = awful.widget.layoutbox(s)
  -- local layoutBox = clickable_container(awful.widget.layoutbox(s))
  layoutBox:buttons(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  )
  return layoutBox
end

return mylayoutbox