local awful = require('awful')
require('awful.autofocus')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('config.keys.mod').modKey
local altkey = require('config.keys.mod').altKey
local apps = require('config.apps')

general = require("config.keys.bindings.general")
focus = require("config.keys.bindings.focus")
hotkeyes = require("config.keys.bindings.hotkeys")
layout = require("config.keys.bindings.layout")
programs = require("config.keys.bindings.programs")
-- -- I must first fix the client stuff
-- client = require("config.client.keys")

-- Key bindings
local globalKeys = awful.util.table.join(
    general,
    focus,
    hotkeys,
    layout,
    programs
)

return globalKeys
