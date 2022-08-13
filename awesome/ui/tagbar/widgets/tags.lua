local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require("gears")

local naughty = require("naughty")


-- ███████ ███████ ████████ ████████ ██ ███    ██  ██████  ███████ 
-- ██      ██         ██       ██    ██ ████   ██ ██       ██      
-- ███████ █████      ██       ██    ██ ██ ██  ██ ██   ███ ███████ 
--      ██ ██         ██       ██    ██ ██  ██ ██ ██    ██      ██ 
-- ███████ ███████    ██       ██    ██ ██   ████  ██████  ███████



local modkey = "Mod4"



-- ██████  ███████ ███    ██ ██████  ███████ ██████  ██ ███    ██  ██████  
-- ██   ██ ██      ████   ██ ██   ██ ██      ██   ██ ██ ████   ██ ██       
-- ██████  █████   ██ ██  ██ ██   ██ █████   ██████  ██ ██ ██  ██ ██   ███ 
-- ██   ██ ██      ██  ██ ██ ██   ██ ██      ██   ██ ██ ██  ██ ██ ██    ██ 
-- ██   ██ ███████ ██   ████ ██████  ███████ ██   ██ ██ ██   ████  ██████



return function(s)

    local bg = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        layout = wibox.layout.fixed.vertical,
        widget_template = {
            {
                {
                    {
                        {
                            {
                                wibox.widget.base.make_widget(),
                                id = "indicator",
                                forced_width = 3,
                                forced_height = 48,
                                widget  = wibox.container.background
                            },
                            halign = "left",
                            fill_vertical = true,
                            content_fill_vertical = true,
                            forced_width = 3,
                            forced_height = 48,
                            widget = wibox.container.place
                        },
                        {
                            {
                                image = os.getenv("HOME").."/.config/awesome/resources/images/icons/arch.svg",
                                id = "ico",
                                widget = wibox.widget.imagebox,
                                forced_width = 28,
                                forced_height = 28
                            },
                            forced_width = 48,
                            forced_height = 48,
                            widget = wibox.container.place
                        },
                        layout = wibox.layout.stack
                    },
                    widget = wibox.container.background
                },
                layout = wibox.layout.fixed.vertical
            },
            forced_width = 48,
            forced_height = 48,
            widget = wibox.container.background,
            -- Add support for hover colors and an index label
            create_callback = function(self, c3, index, objects) --luacheck: no unused args

                local colourSelectedTags = function()
                    if objects[index].selected then
                        self:get_children_by_id('indicator')[1].bg = "#47e686"
                    elseif self:get_children_by_id('indicator')[1].hover then
                        self:get_children_by_id('indicator')[1].bg = "#93fabc"
                    else
                        self:get_children_by_id('indicator')[1].bg = "#00000000"
                    end
                end

                self:get_children_by_id('ico')[1].image = os.getenv("HOME").."/.config/awesome/resources/images/icons/" .. objects[index].name .. ".svg",

                self:connect_signal('mouse::enter', function()
                    self:get_children_by_id('indicator')[1].hover = true
                    colourSelectedTags()
                end)
                self:connect_signal('mouse::leave', function()
                    self:get_children_by_id('indicator')[1].hover = false
                    colourSelectedTags()
                end)
                objects[index]:connect_signal('property::selected', function()
                    colourSelectedTags()
                end)

                colourSelectedTags()
            end
        },
        buttons = gears.table.join(
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ }, 3, function(t) awful.tag.viewtoggle(t) end)
        )
    }

    return bg
end