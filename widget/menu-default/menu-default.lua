local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local apps = require('config.apps')
local hotkeys_popup = require("awful.hotkeys_popup")


-- {{{ Menu
-- Create a launcher widget and a main menu
local myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", apps.default.terminal .. " -e man awesome" },
    { "edit config", apps.default.editor .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
 }
 
local mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                     { "open terminal", apps.default.terminal }
                                   }
                         })
return mymainmenu