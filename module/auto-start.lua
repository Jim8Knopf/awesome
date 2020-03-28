-- MODULE AUTO-START
-- Run all the apps listed in configuration/apps.lua as run_on_start_up only once when awesome start

require('awful.autofocus')
local beautiful = require('beautiful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

require('configuration.tags')
local awful = require('awful')
local apps = require('configuration.apps')

local function run_once(cmd)
  local findme = cmd
  local firstspace = cmd:find(' ')
  if firstspace then
    findme = cmd:sub(0, firstspace - 1)
  end
  awful.spawn.with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd))
end

for _, app in ipairs(apps) do 
  run_once(app.run_on_start_up)
end

local function move_to_new_tag(cmd)
  local findme = cmd
  local firstspace = cmd:find(' ')
  if firstspace then
    findme = cmd:sub(0, firstspace - 1)
  end
  awful.spawn.with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd))

  -- local c = 4
  -- if not c then return end

  -- local t = 4 --awful.tag.add(c.class,{screen= c.screen })
  -- c:tags({t})
  -- t:view_only()
  -- -- local function run_once(cmd)
  --   awful.spawn.with_shell('code')
  -- end
end