local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')

local search = require(... .. ".widgets.search")
local notification_center = require(... .. ".widgets.notification_center")

local volume_data = require("extern.volume")

local volume = require(... .. ".widgets.volume")
local gain = require(... .. ".widgets.gain")
local power = require(... .. ".widgets.power")

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
        x = screen.geometry.x,
        y = 0,
        width = 250,
        height = screen.geometry.height,
        bg = "#2e3540",
        fg = beautiful.fg_normal
    }

    local volume_widget = volume(screen)
    local gain_widget = gain(screen)


    panel.setVisible = function(v)
        volume_widget.update()
        gain_widget.update()
        panel.visible = v
    end

    panel:setup {
        search(s),
        notification_center(s),
        {
            volume_widget,
            gain_widget,
            power(s),
            layout = wibox.layout.align.vertical
        },
        layout = wibox.layout.align.vertical,
    }

    return panel
end