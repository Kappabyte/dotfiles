local awful = require("awful")
local beautiful = require("beautiful")

local client = require("keys.client")

return {
    default = function() 
        return {
            rule = { },
            properties = {
                border_width = beautiful.border_width,
                border_color = beautiful.border_normal,
                focus = awful.client.focus.filter,
                raise = true,
                keys = client.clientkeys,
                buttons = client.clientbuttons,
                screen = awful.screen.preferred,
                placement = awful.placement.no_overlap+awful.placement.no_offscreen
            }
        }
    end,
    terminal = function()
        return {
            rule = { },
            except = {
                class = "Alacritty"
            },
            properties = {
                tag = "1"
            }
        }
    end
}