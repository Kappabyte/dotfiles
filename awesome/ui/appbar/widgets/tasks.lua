local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require("gears")



-- ███████ ███████ ████████ ████████ ██ ███    ██  ██████  ███████ 
-- ██      ██         ██       ██    ██ ████   ██ ██       ██      
-- ███████ █████      ██       ██    ██ ██ ██  ██ ██   ███ ███████ 
--      ██ ██         ██       ██    ██ ██  ██ ██ ██    ██      ██ 
-- ███████ ███████    ██       ██    ██ ██   ████  ██████  ███████



local height = 48



-- ██████  ███████ ███    ██ ██████  ███████ ██████  ██ ███    ██  ██████  
-- ██   ██ ██      ████   ██ ██   ██ ██      ██   ██ ██ ████   ██ ██       
-- ██████  █████   ██ ██  ██ ██   ██ █████   ██████  ██ ██ ██  ██ ██   ███ 
-- ██   ██ ██      ██  ██ ██ ██   ██ ██      ██   ██ ██ ██  ██ ██ ██    ██ 
-- ██   ██ ███████ ██   ████ ██████  ███████ ██   ██ ██ ██   ████  ██████



return function(s)

    local tasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = gears.table.join(
            awful.button({ }, 1, function (c)
                c:emit_signal(
                    "request::activate",
                    "tasklist",
                    {raise = true})
                end),
            awful.button({ }, 2, function (c)
                c:kill()
                end),
            awful.button({ }, 3, function(c)
                if c.minimized == false then
                    c.minimized = true
                else
                    c:emit_signal(
                        "request::activate",
                        "tasklist",
                        {raise = true})
                end
                end)),
        layout   = {
            spacing = 0,
            layout  = wibox.layout.flex.horizontal
        },
        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.
        widget_template = {
            {
                {
                    {
                        {
                            {
                                id     = 'icon_role',
                                widget = wibox.widget.imagebox,
                            },
                            margins = 12,
                            widget  = wibox.container.margin,
                        },
                        {
                            {
                                {
                                    {
                                        id     = 'text_role',
                                        font = "comfortaa 16",
                                        widget = wibox.widget.textbox,
                                    },
                                    layout = wibox.layout.fixed.horizontal,
                                },
                                width = 200,
                                forced_height = 20,
                                widget = wibox.container.constraint
                            },
                            forced_height = 10,
                            widget = wibox.container.place
                        },
                        layout = wibox.layout.fixed.horizontal,
                    },
                    left  = 10,
                    right = 10,
                    widget = wibox.container.margin
                },
                {
                    {
                        wibox.widget.base.make_widget(),
                        bg = "#00ff00",
                        id = "indicator",
                        forced_width = 250,
                        forced_height = 3,
                        widget  = wibox.container.background
                    },
                    valign = "top",
                    fill_horizontal = true,
                    content_fill_horizontal = true,
                    forced_width = 250,
                    forced_height = 3,
                    widget = wibox.container.place
                },
                layout = wibox.layout.stack
            },
            forced_width = 250,
            widget = wibox.container.background,
            create_callback = function(self, c, index, objects) --luacheck: no unused args
                local colourSelectedTasks = function()
                    if c == client.focus then
                        self:get_children_by_id('indicator')[1].bg = "#47e686"
                    elseif self:get_children_by_id('indicator')[1].hover then
                        self:get_children_by_id('indicator')[1].bg = "#93fabc"
                    else
                        self:get_children_by_id('indicator')[1].bg = "#00000000"
                    end
                end

                c:connect_signal("focus", function()
                    colourSelectedTasks()
                end)
                c:connect_signal("unfocus", function()
                    colourSelectedTasks()
                end)

                self:connect_signal("mouse::enter", function()
                    self:get_children_by_id('indicator')[1].hover = true
                    colourSelectedTasks()
                end)
                self:connect_signal("mouse::leave", function()
                    self:get_children_by_id('indicator')[1].hover = false
                    colourSelectedTasks()
                end)

                colourSelectedTasks()
            end,
        }
    }

    return tasklist
end