local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local watch = require("awful.widget.watch")
local wibox = require("wibox")



-- Create a textclock widget
local mytextclock = wibox.widget.textclock()


--!!-- E: awesome: Value of 'foreground' attribute on <span> tag on line 1 could not be parsed; should be a color specification, not 'nil'



-- Add a calendar (credits to kylekewley for the original code)
local month_calendar = awful.widget.calendar_popup.month({
    screen = s,
    start_sunday = false,
    week_numbers = true
  })
  month_calendar:attach(mytextclock)

return mytextclock