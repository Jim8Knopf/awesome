local awful = require('awful')
-- local top_panel = require('layout.top-panel')

-- -- Create a wibox for each screen and add it
-- awful.screen.connect_for_each_screen(
--   function(s)
--     -- Create the Top bar
--     s.top_panel = top_panel(s)
--   end
-- )

-- -- Hide bars when app go fullscreen
-- function updateBarsVisibility()
--   for s in screen do
--     if s.selected_tag then
--       local fullscreen = s.selected_tag.fullscreenMode
--       -- Order matter here for shadow
--       s.top_panel.visible = not fullscreen
--     end
--   end
-- end


-- theas ar the tiling layouts.
-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.corner.nw,
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}