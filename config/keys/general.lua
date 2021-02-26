local awful = require('awful')
require('awful.autofocus')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('config.keys.mod').modKey
local altkey = require('config.keys.mod').altKey
local apps = require('config.apps')
local group = "awesome"
-- Key bindings
local general = awful.util.table.join({
    -- General Awesome keys
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
    {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
    {description = "show main menu", group = group}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
    {description = "reload awesome", group = group}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
    {description = "quit awesome", group = group}),
    awful.key({ modkey }, "x",
    function ()
        awful.prompt.run {
            prompt       = "Run Lua code: ",
            textbox      = awful.screen.focused().mypromptbox.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. "/history_eval"
        }
    end,
    {description = "lua execute prompt", group = group}),
    awful.key({ modkey,           }, "Return", function () awful.spawn(apps.default.terminal) end,
    {description = "open a terminal", group = group}),
    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
    {description = "run prompt", group = group}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = group}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = group}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = group}),
    awful.key({ modkey }, "p", function() menubar.show() end, --doesn't work jet
    {description = "show the menubar", group = group}),

    awful.key(
      {modkey}, 'F2',
      function()
      awful.spawn("arandr")
      end,
      {description = 'Display settings', group = 'awesome'}),
  
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = group,
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = group,
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = group,
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control", "Shift" },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = group,
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    }, 
    awful.key(
        {modkey},
        't',
        function()
            awful.spawn(
                awful.screen.focused().selected_tag.defaultApp,
                {
                    tag = _G.mouse.screen.selected_tag,
                    placement = awful.placement.bottom_right
                }
            )
        end,
        {description = 'open default program for tag/workspace', group = 'tag'}
    ),
    
})

return general