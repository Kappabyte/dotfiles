local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require('gears')



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



return function(text, icon, getState, setState)

    local bg = wibox.widget {
        {
            {
                {
                    {
                        {
                            image = icon,                
                            resize = true,
                            forced_width = 32,
                            forced_height = 32,
                            widget = wibox.widget.imagebox
                        },
                        margins = 8,
                        forced_width = 40,
                        widget = wibox.container.margin
                    },
                    {
                        {
                            text = text,
                            font = "Noto Sans 11",
                            align = "left",
                            widget = wibox.widget.textbox
                        },
                        top = -2,
                        right = 5,
                        widget = wibox.container.margin
                    },
                    nil,
                    layout = wibox.layout.align.horizontal
                },
                forced_height = 40,
                widget = wibox.container.margin
            },
            layout = wibox.layout.fixed.vertical
        },
        bg = beautiful.bg_mid,
        --shape = gears.shape.rounded_rect,
        widget = wibox.container.background
    }

    bg.buttons = gears.table.join(
        awful.button({ }, 1, function(t) 
            setState(not getState()) 
            local state = getState()
            if state then
                bg.bg = "#47e686"
            else
                bg.bg = "#272c36"
            end
        end)
    )

    return wibox.widget {
        bg,
        margins = 10,
        widget = wibox.container.margin
    }
end