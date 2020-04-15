local awful = require('awful')
require('awful.autofocus')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('config.keys.mod').modKey
local altkey = require('config.keys.mod').altKey
local apps = require('config.apps')
-- Key bindings
local globalKeys = awful.util.table.join(
    -- keybindings
    require("config.keys.programs"),
    require("config.keys.general")
)

-- -- Bind all key numbers to tags.
-- -- Be careful: we use keycodes to make it works on any keyboard layout.
-- -- This should map on the top row of your keyboard, usually 1 to 9.
-- for i = 1, 9 do
--   -- Hack to only show tags 1 and 9 in the shortcut window 
--   local descr_view, descr_toggle, descr_move, descr_toggle_focus
--   if i == 1 or i == 9 then
--     descr_view = {description = 'view tag #', group = 'tag'}
--     descr_toggle = {description = 'toggle tag #', group = 'tag'}
--     descr_move = {description = 'move focused client to tag #', group = 'tag'}
--     descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
--   end
--   globalKeys =
--     awful.util.table.join(
--     globalKeys,
--     -- View tag only.
--     awful.key(
--       {modkey},
--       '#' .. i + 9,
--       function()
--         local screen = awful.screen.focused()
--         local tag = screen.tags[i]
--         if tag then
--           tag:view_only()
--         end
--       end,
--       descr_view
--     ),
--     -- Toggle tag display.
--     awful.key(
--       {modkey, 'Control'},
--       '#' .. i + 9,
--       function()
--         local screen = awful.screen.focused()
--         local tag = screen.tags[i]
--         if tag then
--           awful.tag.viewtoggle(tag)
--         end
--       end,
--       descr_toggle
--     ),
--     -- Move client to tag.
--     awful.key(
--       {modkey, 'Shift'},
--       '#' .. i + 9,
--       function()
--         if _G.client.focus then
--           local tag = _G.client.focus.screen.tags[i]
--           if tag then
--             _G.client.focus:move_to_tag(tag)
--           end
--         end
--       end,
--       descr_move
--     ),
--     -- Toggle tag on focused client.
--     awful.key(
--       {modkey, 'Control', 'Shift'},
--       '#' .. i + 9,
--       function()
--         if _G.client.focus then
--           local tag = _G.client.focus.screen.tags[i]
--           if tag then
--             _G.client.focus:toggle_tag(tag)
--           end
--         end
--       end,
--       descr_toggle_focus
--     )
--   )
-- end

return globalKeys
