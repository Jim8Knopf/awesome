-------------------------------------------------
-- Package Updater Widget for Awesome Window Manager
-- Shows the package updates information in Arch Linux
-- Will only show if there is/are updates available
-------------------------------------------------

local awful = require('awful')
local naughty = require('naughty')
local wibox = require('wibox')
local gears = require('gears')

local watch = awful.widget.watch

local apps = require('configuration.apps')

local clickable_container = require('widget.clickable-container')
local dpi = require('beautiful').xresources.apply_dpi

local config_dir = gears.filesystem.get_configuration_dir()

local widget_icon_dir = config_dir .. 'widget/package-updater/icons/'


local update_available = false
local number_of_updates_available = nil
local update_package = nil

local taglist = function()
    -- create the taglist
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        style   = {
            shape = gears.shape.powerline
        },
        layout   = {
            spacing = -12,
            spacing_widget = {
                color  = '#00ff00', -- color of the arrows
                shape  = gears.shape.powerline,
                widget = wibox.widget.separator,
            },
            layout  = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            {
                                id     = 'index_role',
                                widget = wibox.widget.textbox,
                            },
                            margins = 4,
                            widget  = wibox.container.margin,
                        },
                        bg     = '#ff0000', -- color of the bubble
                        shape  = gears.shape.circle,
                        widget = wibox.container.background,
                    },
                    {
                        {
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        widget  = wibox.container.margin,
                    },
                    {
                        id      = 'text_role',
                        color   = '#0000ff',
                        widget  = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left  = 18,
                right = 18,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
            -- Add support for hover colors and an index label
            create_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:get_children_by_id('index_role')[1].markup = '<b> '..c3.index..' </b>'
                self:connect_signal('mouse::enter', function()
                    if self.bg ~= '#ff0000' then
                        self.backup     = self.bg
                        self.has_backup = true
                    end
                    self.bg = '#ff0000'
                end)
                self:connect_signal('mouse::leave', function()
                    if self.has_backup then self.bg = self.backup end
                end)
            end,
            update_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:get_children_by_id('index_role')[1].markup = '<b> '..c3.index..' </b>'
            end,
        },
        buttons = taglist_buttons
    }

end

return taglist