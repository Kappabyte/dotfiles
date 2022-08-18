local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')

local home = require(... .. ".widgets.home")
local tags = require(... .. ".widgets.tags")
local status = require(... .. ".widgets.status")



-- ███████ ███████ ████████ ████████ ██ ███    ██  ██████  ███████ 
-- ██      ██         ██       ██    ██ ████   ██ ██       ██      
-- ███████ █████      ██       ██    ██ ██ ██  ██ ██   ███ ███████ 
--      ██ ██         ██       ██    ██ ██  ██ ██ ██    ██      ██ 
-- ███████ ███████    ██       ██    ██ ██   ████  ██████  ███████



local width = 48



-- ██████  ███████ ███    ██ ██████  ███████ ██████  ██ ███    ██  ██████  
-- ██   ██ ██      ████   ██ ██   ██ ██      ██   ██ ██ ████   ██ ██       
-- ██████  █████   ██ ██  ██ ██   ██ █████   ██████  ██ ██ ██  ██ ██   ███ 
-- ██   ██ ██      ██  ██ ██ ██   ██ ██      ██   ██ ██ ██  ██ ██ ██    ██ 
-- ██   ██ ███████ ██   ████ ██████  ███████ ██   ██ ██ ██   ████  ██████



return function(screen)

    local panel = wibox {
        ontop = true,
        visible = true,
        screen = screen,
        x = 0,
        y = 0,
        width = width,
        height = screen.geometry.height,
        bg = "#232830",
        fg = beautiful.fg_normal
    }
    
    panel.setOffset = function(o) 
        panel.x = screen.geometry.x + o
    end

    panel:struts {
        left = width
    }

    local home_widget = home(screen)
    local tags_widget = tags(screen)
    local status_widget = status(screen)

    panel:setup {
        home_widget,
        tags_widget,
        status_widget,
        layout = wibox.layout.align.vertical,
    }

    return panel
end