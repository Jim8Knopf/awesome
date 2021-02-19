local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local menu = require("widget.menu-default.menu-default")
local HOME_DIR = os.getenv("HOME")
local WIDGET_DIR = HOME_DIR .. '/.config/awesome/widget/launcher-default/'
local icon = WIDGET_DIR .. '/icons/archlinux-logo.svg'

 local mylauncher = awful.widget.launcher({ image = icon,
 menu = menu })

 return mylauncher