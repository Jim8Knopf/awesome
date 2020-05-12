local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')

-- local icons = require('theme.icons')
local dpi = beautiful.xresources.apply_dpi

-- local clickable_container = require('widget.clickable-container')
-- local task_list = require('widget.task-list')



local TopPanel = function(s, offset)

	local offsetx = 0
	if offset == true then
		offsetx = dpi(45)
	end

	local panel = wibox
	{
		ontop = true,
		screen = s,
		type = 'dock',
		height = dpi(28),
		width = s.geometry.width - offsetx,
		x = s.geometry.x + offsetx,
		y = s.geometry.y,
		stretch = false,
		bg = beautiful.background,
		fg = beautiful.fg_normal
	}
	

	panel:struts
	{
		top = dpi(28)
	}


	panel:connect_signal(
		'mouse::enter',
		function() 
			local w = mouse.current_wibox
			if w then
				w.cursor = 'left_ptr'
			end
		end
        
	)
    
    -- Keyboard map indicator and switcher
    mykeyboardlayout = awful.widget.keyboardlayout()
    
    -- Create a textclock widget
    mytextclock = wibox.widget.textclock()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc( 1) end),
            awful.button({ }, 5, function () awful.layout.inc(-1) end),
        }
    }

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            -- awful.button({ modkey }, 1, function(t)
            --     if client.focus then
            --         client.focus:move_to_tag(t)
            --     end
            -- end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            -- awful.button({ modkey }, 3, function(t)
            --     if client.focus then
            --         client.focus:toggle_tag(t)
            --     end
            -- end),
            awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end),
        }
    }
    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({ }, 4, function() awful.client.focus.byidx( 1) end),
            awful.button({ }, 5, function() awful.client.focus.byidx(-1) end),
        }
    }
    
    
    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })
    
    -- Add widgets to the wibox
    s.mywibox.widget = {
        layout = wibox.layout.align.horizontal,
        -- { -- Left widgets
        -- layout = wibox.layout.fixed.horizontal,
        --     mylauncher,
        -- s.mytaglist,
        --     s.mypromptbox,
        -- },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            -- wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
    
    
	return panel
end


return TopPanel


-- -- {{{ Wibar

-- -- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()

-- -- Create a textclock widget
-- mytextclock = wibox.widget.textclock()

-- screen.connect_signal("request::wallpaper", function(s)
--     -- Wallpaper
--     if beautiful.wallpaper then
--         local wallpaper = beautiful.wallpaper
--         -- If wallpaper is a function, call it with the screen
--         if type(wallpaper) == "function" then
--             wallpaper = wallpaper(s)
--         end
--         gears.wallpaper.maximized(wallpaper, s, true)
--     end
-- end)

-- screen.connect_signal("request::desktop_decoration", function(s)
--     -- Each screen has its own tag table.
--     awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

--     -- Create a promptbox for each screen
--     s.mypromptbox = awful.widget.prompt()

--     -- Create an imagebox widget which will contain an icon indicating which layout we're using.
--     -- We need one layoutbox per screen.
--     s.mylayoutbox = awful.widget.layoutbox {
--         screen  = s,
--         buttons = {
--             awful.button({ }, 1, function () awful.layout.inc( 1) end),
--             awful.button({ }, 3, function () awful.layout.inc(-1) end),
--             awful.button({ }, 4, function () awful.layout.inc( 1) end),
--             awful.button({ }, 5, function () awful.layout.inc(-1) end),
--         }
--     }

    -- -- Create a taglist widget
    -- s.mytaglist = awful.widget.taglist {
    --     screen  = s,
    --     filter  = awful.widget.taglist.filter.all,
    --     buttons = {
    --         awful.button({ }, 1, function(t) t:view_only() end),
    --         awful.button({ modkey }, 1, function(t)
    --                                         if client.focus then
    --                                             client.focus:move_to_tag(t)
    --                                         end
    --                                     end),
    --         awful.button({ }, 3, awful.tag.viewtoggle),
    --         awful.button({ modkey }, 3, function(t)
    --                                         if client.focus then
    --                                             client.focus:toggle_tag(t)
    --                                         end
    --                                     end),
    --         awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    --         awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end),
    --     }
    -- }

    -- -- Create a tasklist widget
    -- s.mytasklist = awful.widget.tasklist {
    --     screen  = s,
    --     filter  = awful.widget.tasklist.filter.currenttags,
    --     buttons = {
    --         awful.button({ }, 1, function (c)
    --             c:activate { context = "tasklist", action = "toggle_minimization" }
    --         end),
    --         awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
    --         awful.button({ }, 4, function() awful.client.focus.byidx( 1) end),
    --         awful.button({ }, 5, function() awful.client.focus.byidx(-1) end),
    --     }
    -- }

    -- Create the wibox
    -- s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    -- s.mywibox.widget = {
    --     layout = wibox.layout.align.horizontal,
    --     { -- Left widgets
    --         layout = wibox.layout.fixed.horizontal,
    --         mylauncher,
    --         s.mytaglist,
    --         s.mypromptbox,
    --     },
    --     s.mytasklist, -- Middle widget
    --     { -- Right widgets
    --         layout = wibox.layout.fixed.horizontal,
    --         mykeyboardlayout,
    --         wibox.widget.systray(),
    --         mytextclock,
    --         s.mylayoutbox,
    --     },
    -- }
-- end)
-- -- }}}