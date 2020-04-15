local awful = require('awful')
require('awful.autofocus')

local modkey = require('config.keys.mod').modKey
local altkey = require('config.keys.mod').altKey
local apps = require('config.apps')
-- Key bindings
local programs = awful.util.table.join(
    -- keybindings
    awful.key(
        {altkey, 'Control'}, 'n',
        function()
            awful.util.spawn_with_shell(apps.default.netflix)
        end,
        {description = 'Opens netflix now', group = 'programs'}
    )
)
return programs
