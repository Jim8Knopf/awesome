local awful = require('awful')
require('awful.autofocus')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('config.keys.mod').modKey
local altkey = require('config.keys.mod').altKey
local apps = require('config.apps')
local group = "programs"
-- Key bindings
local programs = awful.util.table.join(
    -- standard programs
    awful.key(
        {modkey}, 'v',
        function()
            awful.util.spawn_with_shell(apps.default.editor)
        end,
        {description = 'Opens the editor(vsCode)', group = group}
    ),
    awful.key(
        {modkey}, 'b',
        function()
            awful.util.spawn_with_shell(apps.default.browser)
        end,
        {description = 'Opens the browser(firefox)', group = group}
    ),
    awful.key(
        {modkey}, 'e',
        function()
            awful.util.spawn_with_shell(apps.default.files)
        end,
        {description = 'Opens the file manager(thunar)', group = group}
    ),
    
    -- keybindings
    awful.key(
        {modkey},
        'Print',
        function()
            awful.util.spawn_with_shell(apps.default.delayed_screenshot)
        end,
        {description = 'Mark an area and screenshot it 10 seconds later (clipboard)', group = group}
    ),
    awful.key(
        {},
        'Print',
        function()
            awful.util.spawn_with_shell(apps.default.screenshot)
        end,
        {description = 'Take a screenshot of your active monitor and copy it to clipboard', group = group}
    ),
    awful.key(
        {'Control'},
        'Print',
        function()
            awful.util.spawn_with_shell(apps.default.region_screenshot)
        end,
        {description = 'Mark an area and screenshot it to your clipboard', group = group}
    ),
    awful.key(
        {modkey, altkey}, 'n',
        function()
            awful.util.spawn_with_shell("qtws /usr/share/qtws-apps/netflix/netflix.qtws")
        end,
        {description = 'Opens netflix', group = group}
    ),
    awful.key(
        {modkey, altkey}, 'd',
        function()
            awful.util.spawn_with_shell("discord")
        end,
        {description = 'Opens discord', group = group}
    ),
    awful.key(
        {modkey, altkey}, 's',
        function()
            awful.util.spawn_with_shell("spotify")
        end,
        {description = 'Opens spotify', group = group}
    ),
    awful.key(
        {modkey, altkey}, 'o',
        function()
            awful.util.spawn_with_shell("obs")
        end,
        {description = 'Opens obs', group = group}
    ),
    awful.key(
        {altkey,'Control'}, 'd',
        function()
            awful.spawn.with_shell("arandr")
        end,
        {description = 'Opens screen manager', group = group}
    ),
    -- System Monitor hotkey
    awful.key(
      {modkey},
      'm',
      function()
        awful.util.spawn_with_shell('mate-system-monitor')
      end,
      {description = 'Opens mate system monitoring', group = group}
    ),
    -- Emoji Picker
    awful.key(
      {modkey},
      'a',
      function()
        awful.util.spawn_with_shell('ibus emoji')
      end,
      {description = 'Open the ibus emoji picker to copy an emoji to your clipboard', group = group}
    )
)
return programs
