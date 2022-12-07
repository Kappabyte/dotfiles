local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require("gears")

local button = require("ui.widgets.button")

local recent_notifications = require("notifications.recent")

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
                    image = os.getenv("HOME").."/.config/awesome/resources/images/icons/power.svg",
                    widget = wibox.widget.imagebox
                },
                top = 10,
                left = 25,
                right = 25,
                bottom = 20,
                widget = wibox.container.margin,
                buttons = gears.table.join(
                    awful.button({ }, 1, function()
                        awful.spawn.with_shell("gksudo shutdown now")
                    end)
                )
            },
            {
                {
                    image = os.getenv("HOME").."/.config/awesome/resources/images/icons/restart.svg",
                    widget = wibox.widget.imagebox
                },
                top = 10,
                left = 25,
                right = 25,
                bottom = 20,
                widget = wibox.container.margin,
                buttons = gears.table.join(
                    awful.button({ }, 1, function()
                        awful.spawn.with_shell("gksudo reboot")
                    end)
                )
            },
            {
                {
                    image = os.getenv("HOME").."/.config/awesome/resources/images/icons/logout-variant.svg",
                    widget = wibox.widget.imagebox
                },
                top = 10,
                left = 25,
                right = 25,
                bottom = 20,
                widget = wibox.container.margin,
                buttons = gears.table.join(
                    awful.button({ }, 1, function(t)
                        awesome.quit()
                    end)
                )
            },
            layout = wibox.layout.flex.horizontal
        },
        widget = wibox.container.background
    }

    return bg
end