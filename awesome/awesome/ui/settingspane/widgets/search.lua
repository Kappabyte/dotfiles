local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require("gears")



-- ███████ ███████ ████████ ████████ ██ ███    ██  ██████  ███████ 
-- ██      ██         ██       ██    ██ ████   ██ ██       ██      
-- ███████ █████      ██       ██    ██ ██ ██  ██ ██   ███ ███████ 
--      ██ ██         ██       ██    ██ ██  ██ ██ ██    ██      ██ 
-- ███████ ███████    ██       ██    ██ ██   ████  ██████  ███████







-- ██████  ███████ ███    ██ ██████  ███████ ██████  ██ ███    ██  ██████  
-- ██   ██ ██      ████   ██ ██   ██ ██      ██   ██ ██ ████   ██ ██       
-- ██████  █████   ██ ██  ██ ██   ██ █████   ██████  ██ ██ ██  ██ ██   ███ 
-- ██   ██ ██      ██  ██ ██ ██   ██ ██      ██   ██ ██ ██  ██ ██ ██    ██ 
-- ██   ██ ███████ ██   ████ ██████  ███████ ██   ██ ██ ██   ████  ██████



return function(screen)

    local bg = wibox.widget {
        {
            {
                {
                    {
                        markup = "",
                        align  = "center",
                        valign = "center",
                        font = "Noto Sans 12",
                        widget = wibox.widget.textbox
                    },
                    top = 3,
                    left = -14,
                    widget = wibox.container.margin
                },
                forced_width = 40,
                forced_height = 40,
                widget = wibox.container.constraint
            },
            {
                {
                    {
                        markup = "Search",
                        align  = "center",
                        valign = "center",
                        font = "Noto Sans 10",
                        widget = wibox.widget.textbox
                    },
                    top = 0,
                    left = -2,
                    widget = wibox.container.margin
                },
                forced_height = 40,
                widget = wibox.container.constraint
            },
            layout = wibox.layout.fixed.horizontal
        },
        forced_height = 48,
        widget = wibox.container.background,
        buttons = gears.table.join(
            awful.button({ }, 1, function(t) awful.spawn.with_shell("~/.config/awesome/ui/rofi/launcher.sh > ~/.config/awesome/out.txt") end)
        )
    }

    return bg
end