local awful = require('awful')
require('awful.autofocus')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('config.keys.mod').modKey
local altkey = require('config.keys.mod').altKey
local apps = require('config.apps')
local group = "hotkeys"

-- Layout related keybindings

local hotkeys = awful.util.table.join(
    
  -- Brightness
  awful.key(
    {},
    'XF86MonBrightnessUp',
    function()
      awful.spawn('light -A 5')
    end,
    {description = '+10%', group = group}
  ),
  awful.key(
    {},
    'XF86MonBrightnessDown',
    function()
      awful.spawn('light -U 5')
    end,
    {description = '-10%', group = group}
  ),
  -- ALSA volume control
  awful.key(
    {},
    'XF86AudioRaiseVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 1%+')
    end,
    {description = 'volume up', group = group}
  ),
  awful.key(
    {},
    'XF86AudioLowerVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 1%-')
    end,
    {description = 'volume down', group = group}
  ),
  awful.key(
    {},
    'XF86AudioMute',
    function()
      awful.spawn('amixer -D pulse set Master 1+ toggle')
    end,
    {description = 'toggle mute', group = group}
  ),
  awful.key(
    {},
    'XF86AudioNext',
    function()
      -- TODO
    end,
    {description = 'toggle mute', group = group}
  ),
  awful.key(
    {},
    'XF86PowerDown',
    function()
      -- TODO
    end,
    {description = 'toggle mute', group = group}
  ),
  awful.key(
    {},
    'XF86PowerOff',
    function()
      _G.exit_screen_show()
    end,
    {description = 'toggle mute', group = group}
  ),
  awful.key(
    {altkey},
    'Left',
    function()
      awful.util.spawn_with_shell("variety -p")
    end,
    {description = 'previous background', group = group}
  ),
  awful.key(
    {altkey},
    'Right',
    function()
      awful.util.spawn_with_shell("variety -n")
    end,
    {description = 'next background', group = group}
  )
)
    
return hotkeys
