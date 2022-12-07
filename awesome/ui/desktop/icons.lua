local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local naughty = require('naughty')
local gears = require('gears')
local rubato = require("lib.rubato")

local icons = require("settings/desktop_icons")

local menubarutils = require("menubar.utils")

local padding = 24

local size = 32 + padding


-- ██████  ███████ ███    ██ ██████  ███████ ██████  ██ ███    ██  ██████  
-- ██   ██ ██      ████   ██ ██   ██ ██      ██   ██ ██ ████   ██ ██       
-- ██████  █████   ██ ██  ██ ██   ██ █████   ██████  ██ ██ ██  ██ ██   ███ 
-- ██   ██ ██      ██  ██ ██ ██   ██ ██      ██   ██ ██ ██  ██ ██ ██    ██ 
-- ██   ██ ███████ ██   ████ ██████  ███████ ██   ██ ██ ██   ████  ██████



return function(screen)

    local width = 1;

    local panel = wibox {
        ontop = false,
        visible = true,
        screen = screen,
        x = screen.geometry.x + screen.geometry.width / 2 - width / 2,
        y = screen.geometry.height - size,
        width = width,
        height = size,
        shape = function(cr, width, height)
            gears.shape.partially_rounded_rect(cr, width, height, true, true, false, false, 8)
        end,
        bg = beautiful.bg_dark,
        fg = beautiful.fg_dark,
        opacity = 0.5
    }

    local mainWidget = wibox.widget {
        layout = wibox.layout.fixed.horizontal,
    }

    local drawPanel = function(screen)
        local icos = icons[screen.selected_tag.name] or {}
        width = size * #icos

        if width < 1 then
            panel.opacity = 0
            return
        end

        panel.x = screen.geometry.x + screen.geometry.width / 2 - width / 2
        panel.width = width
        panel.opacity = 1

        local widgets = {}

        for i, ico in ipairs(icos) do

            local file = menubarutils.parse_desktop_file("/usr/share/applications/" .. ico .. ".desktop")

            local timed = rubato.timed {
                intro = 0.25,
                duration = 0.5,
                pos = 0.5
            }

            local widget = wibox.widget {
                {
                    {
                        image = file.icon_path,
                        resize = true,
                        forced_height = size - padding,
                        forced_width = size - padding,
                        widget = wibox.widget.imagebox
                    },
                    margins = padding / 2,
                    widget = wibox.container.margin
                },
                opacity = 0.5,
                widget = wibox.container.background
            }

            timed:subscribe(function(pos) widget.opacity = pos end)

            widget:buttons(
                awful.util.table.join(
                    awful.button(
                        {},
                        1,
                        nil,
                        function()
                            awful.spawn.with_shell(file.cmdline)
                        end
                    )
                )
            )

            widget:connect_signal("mouse::enter", function()
                timed.target = 1
            end)
            widget:connect_signal("mouse::leave", function()
                timed.target = 0.5
            end)

            table.insert(widgets, widget)
        end
        mainWidget.children = widgets
    end

    panel:setup {
        mainWidget,
        layout = wibox.layout.align.horizontal
    }

    screen:connect_signal("tag::history::update", drawPanel)

    return panel
end