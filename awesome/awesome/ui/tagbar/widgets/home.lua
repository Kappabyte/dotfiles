local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require('gears')



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



return function(screen)

    local icon = wibox.widget {
        image = os.getenv("HOME").."/.config/awesome/resources/images/icons/arch.svg",
        widget = wibox.widget.imagebox,
        forced_width = 28,
        forced_height = 28
    }

    local bg = wibox.widget {
        {
            {
                icon,
                left = 10,
                top = 10,
                widget = wibox.container.margin
            },
            layout = wibox.layout.fixed.vertical
        },
        bg = "#47e686",
        widget = wibox.container.background,
        buttons = gears.table.join(
            awful.button({ }, 1, function(t) screen:emit_signal("menu::toggle") end)
        )
    }

    bg:set_forced_width(48)
    bg:set_forced_height(48)

    return bg
end