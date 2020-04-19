local awful = require('awful')
require('awful.autofocus')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('config.keys.mod').modKey
local altkey = require('config.keys.mod').altKey
local apps = require('config.apps')
-- Key bindings
local globalKeys = awful.util.table.join({
    awful.keyboard.append_global_keybindings(require("config.keys.focus")),
    awful.keyboard.append_global_keybindings(require("config.keys.general")),
    awful.keyboard.append_global_keybindings(require("config.keys.hotkeys")),
    awful.keyboard.append_global_keybindings(require("config.keys.layout")),
    awful.keyboard.append_global_keybindings(require("config.keys.programs"))
})

return globalKeys
