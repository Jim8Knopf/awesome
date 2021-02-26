local awful = require('awful')
require('awful.autofocus')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('config.keys.mod').modKey
local altkey = require('config.keys.mod').altKey
local apps = require('config.apps')
local group = "focus"

-- Focus related keybindings
local focus = awful.util.table.join(
    awful.key({ modkey,           }, "j",
    function ()
        awful.client.focus.byidx( 1)
    end,
    {description = "focus next by index", group = group}
),
awful.key({ modkey,           }, "k",
function ()
    awful.client.focus.byidx(-1)
end,
{description = "focus previous by index", group = group}
),
awful.key({ modkey,           }, "Tab",
function ()
    awful.client.focus.history.previous()
    if client.focus then
        client.focus:raise()
    end
end,
{description = "go back", group = group}),
awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
{description = "focus the next screen", group = group}),
awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
{description = "focus the previous screen", group = group}),
awful.key({ modkey, "Control" }, "n",
function ()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
        c:activate { raise = true, context = "key.unminimize" }
    end
end,
{description = "restore minimized", group = group})

)

return focus