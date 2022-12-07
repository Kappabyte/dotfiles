local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')



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
    local panel = wibox {
        ontop = true,
        visible = false,
        screen = screen,
        x = screen.geometry.x + 48 + 250,
        y = screen.geometry.y + 48,
        width = screen.geometry.width - 48 - 250,
        height = screen.geometry.height,
        bg = "#00000000",
        fg = beautiful.fg_dark
    }

    panel.setVisible = function(v)
        panel.visible = v
    end

    return panel
end