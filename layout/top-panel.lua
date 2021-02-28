local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local widget = require("widget")


-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
-- }}}
-- {{{ Wibar
-- -- Create a wibox for each screen and add it


local tasklist_buttons = gears.table.join(
    awful.button({ }, 1, function (c)
                             if c == client.focus then
                                 c.minimized = true
                             else
                                 c:emit_signal(
                                     "request::activate",
                                     "tasklist",
                                     {raise = true}
                                 )
                             end
                         end),
    awful.button({ }, 3, function()
                             awful.menu.client_list({ theme = { width = 250 } })
                         end),
    awful.button({ }, 4, function ()
                             awful.client.focus.byidx(1)
                         end),
    awful.button({ }, 5, function ()
                             awful.client.focus.byidx(-1)
                         end)
)


local TopPanel = function(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    -- s.layoutbox = widget.layoutbox(s)
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function () awful.layout.inc( 1) end),
        awful.button({ }, 3, function () awful.layout.inc(-1) end),
        awful.button({ }, 4, function () awful.layout.inc( 1) end),
        awful.button({ }, 5, function () awful.layout.inc(-1) end)
    ))

    s.taglist = widget.taglist(s)

    -- Create a tasklist widget
    s.mytasklist = 
    awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    panel = awful.wibar({ 
        position = "top", 
        screen = s, 
        height = 16, 
        fg = "#009900"
    })

    -- Add widgets to the wibox
    panel:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            widget.launcher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            widget.cpu({
                width = 70,
                step_width = 2,
                step_spacing = 0,
                color = '#434c5e'
            }),  
            widget.ram(),
            widget.keyboardLayout,
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            s.layoutbox,
            widget.textClock,
            s.mylayoutbox,
        },
    }
    return panel
end
return TopPanel
-- }}}