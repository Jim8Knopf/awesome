local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local watch = require("awful.widget.watch")
local wibox = require("wibox")



-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

return mytextclock