local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require("gears")
local naughty = require("naughty")

local volume_data = require("extern.volume")


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

    local open
    local close

    local regen_cards

    local isopen = false

    local create_device_info = function(sink_index) 

        local slider = wibox.widget {
            bar_shape           = gears.shape.rounded_rect,
            bar_height          = 3,
            bar_color           = "#353d4a",
            bar_active_color    = "#47e686",
            handle_color        = "#00000000",
            handle_width        = 3,
            value               = volume_data.get_volume(sink_index),
            widget              = wibox.widget.slider,
        }
    
        local volume_text = wibox.widget {
            text = volume_data.get_volume(sink_index).."%",
            forced_width = 40,
            font = "Noto Sans 10",
            widget = wibox.widget.textbox
        }

        slider:connect_signal("property::value", function()
            volume_data.set_volume(sink_index, slider.value)
            volume_text.text = slider.value.."%"
        end)

        return wibox.widget {
            {
                {
                    {
                        {
                            text = volume_data.get_sinks()[sink_index],
                            font = "Noto Sans 10",
                            forced_height = 15,
                            valign = "bottom",
                            widget = wibox.widget.textbox,
                        },
                        forced_width = 50,
                        widget = wibox.container.constraint
                    },
                    top = 10,
                    widget = wibox.container.margin
                },
                {
                    {
                        {
                            slider,
                            width = 100,
                            widget =  wibox.container.constraint
                        },
                        {
                            volume_text,
                            left = 8,
                            right = 8,
                            bottom = 2,
                            widget = wibox.container.margin
                        },
                        layout = wibox.layout.fixed.horizontal,
                    },
                    top = -12,
                    widget = wibox.container.margin
                },
                layout = wibox.layout.fixed.vertical
            },
            width = 155,
            widget =  wibox.container.constraint
        }
    end

    local create_device_card = function(index, part)

        local new_shape = function(cr, width, height)
            gears.shape.partially_rounded_rect(cr, width, height, part == "top" or part == "only", part == "top" or part == "only", part == "bottom" or part == "only", part == "bottom" or part == "only", 10)
        end

        local image = os.getenv("HOME").."/.config/awesome/resources/images/icons/checkbox-marked.svg"
        if(part == "top") then
            image = os.getenv("HOME").."/.config/awesome/resources/images/icons/down.svg"
        elseif(part == "only") then
            image = os.getenv("HOME").."/.config/awesome/resources/images/icons/up.svg"
        end

        return wibox.widget {
            {
                {
                    {
                        image = os.getenv("HOME").."/.config/awesome/resources/images/icons/speaker.svg",                
                        resize = true,
                        forced_width = 32,
                        forced_height = 32,
                        widget = wibox.widget.imagebox
                    },
                    margins = 8,
                    widget = wibox.container.margin
                },
                create_device_info(index),
                {
                    {
                        image = image,                
                        resize = true,
                        widget = wibox.widget.imagebox
                    },
                    top = 9,
                    widget = wibox.container.margin,
                    buttons = gears.table.join(
                        awful.button({ }, 1, function()
                            if(part == "top" or part == "only") then
                                if(isopen) then
                                    close()
                                    isopen = false
                                else
                                    open()
                                    isopen = true
                                end
                            else
                                volume_data.set_default_sink(index)
                                regen_cards()
                                open()
                            end
                        end)
                    )
                },
                layout = wibox.layout.fixed.horizontal
            },
            forced_height = 48,
            --shape = new_shape,
            bg = "#272c36",
            widget = wibox.container.background
        }
    end

    local layout = wibox.widget {
        create_device_card(volume_data.get_default_sink().index, "top"),
        create_device_card(2, "bottom"),
        layout = wibox.layout.fixed.vertical
    }

    local bg = wibox.widget {
        layout,
        margins = 10,
        widget = wibox.container.margin,
    }

    bg.update = function()
        naughty.notify({
            text = "update"
        })
        volume_data.update_source_list()
    end

    bg.update()

    local open_cards = {}
    local closed_cards = {}

    regen_cards = function()
        open_cards = {}
        closed_cards = {}
        table.insert(open_cards, create_device_card(volume_data.get_default_sink().index, "top"))
        for i, sink in ipairs(volume_data.get_sinks()) do
            if(i ~= volume_data.get_default_sink().index) then
                local position
                if i == #volume_data.get_sinks() then
                    position = "bottom"
                else
                    position = "middle"
                end
                table.insert(open_cards, create_device_card(i, position))
            end
        end

        table.insert(closed_cards, create_device_card(volume_data.get_default_sink().index, "only"))
    end

    regen_cards()

    open = function()
        layout.children = open_cards
    end

    close = function()
        layout.children = closed_cards
    end

    close()

    cardid  = 0
    channel = "Master"

    return bg
end