local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')

local tasks = require(... .. ".widgets.tasks")



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



return function(screen, offset)

    local panel = wibox {
        ontop = true,
        visible = true,
        screen = screen,
        x = screen.geometry.x,
        y = 0,
        width = screen.geometry.width - offset,
        height = height,
        bg = beautiful.bg_dark,
        fg = beautiful.fg_dark
    }

    panel.setOffset = function(o) 
        panel.x = screen.geometry.x + o
    end

    panel.setOffset(offset)

    panel:struts {
        top = height
    }

    local widget_tasks = tasks(screen)

    panel:setup {
        widget_tasks,
        layout = wibox.layout.fixed.horizontal,
    }

    return panel
end