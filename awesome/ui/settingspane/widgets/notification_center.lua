local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local gears = require("gears")
local naughty = require("naughty")

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

    local pointer = 0
    local min_widgets = 5
    local carousel = false

    -- Credit to [u/0lMon] on reddit
    local vertical_or_horizontal_layoutbox = wibox.layout.fixed.vertical() -- can be fixed/flexed horizontal/vertical
    vertical_or_horizontal_layoutbox:connect_signal("button::press", function(_,_,_,button)
        if carousel then
            if button == 5 then -- up scrolling
                local cnt = #vertical_or_horizontal_layoutbox.children
                local first_widget = vertical_or_horizontal_layoutbox.children[1]
                vertical_or_horizontal_layoutbox:insert(cnt+1, first_widget)
                vertical_or_horizontal_layoutbox:remove(1)
            elseif button == 4 then -- down scrolling
                local cnt = #vertical_or_horizontal_layoutbox.children
                local last_widget = vertical_or_horizontal_layoutbox.children[cnt]
                vertical_or_horizontal_layoutbox:insert(1, last_widget)
                vertical_or_horizontal_layoutbox:remove(cnt+1)
            end
        else
            if button == 5 then -- up scrolling
                if pointer < #vertical_or_horizontal_layoutbox.children and ((#vertical_or_horizontal_layoutbox.children - pointer) >= min_widgets) then
                    pointer = pointer + 1
                    vertical_or_horizontal_layoutbox.children[pointer].visible = false
                end
            elseif button == 4 then -- down scrolling
                if pointer > 0 then
                    vertical_or_horizontal_layoutbox.children[pointer].visible = true
                    pointer = pointer - 1
                end
            end
        end
    end)
    -- end credit

    local ns = wibox.widget {
        layout = vertical_or_horizontal_layoutbox
    }

    local dnd = false;

    local getDNDState = function()
        return dnd
    end

    local setDNDState = function(state)
        recent_notifications.clear()
        if(state) then
            recent_notifications.clear()
            naughty.notify({
                title = "Silent Mode",
                text = "All future notifications will be silenced",
                icon = os.getenv("HOME").."/.config/awesome/resources/images/icons/DND.svg"
            })
        else
            recent_notifications.clear()
            naughty.notify({
                title = "Silent Mode",
                text = "Silent mode has been disabled",
                icon = os.getenv("HOME").."/.config/awesome/resources/images/icons/DND.svg"
            })
        end
        naughty.suspended = state
        dnd = state
    end

    local updateNotifications
    updateNotifications = function()
        local recent = recent_notifications.get()

        local widgets = {}

        local title_widget = wibox.widget {
            {
                text = "Notification Center",
                font = "Noto Sans 12",
                align = "center",
                widget = wibox.widget.textbox
            },
            top = 10,
            bottom = 20,
            forced_width = 250,
            widget = wibox.container.margin
        }

        table.insert(widgets, title_widget)

        for i,notification in ipairs(recent) do
            local widget = wibox.widget {
                {
                    {
                        {
                            image  = notification.icon,
                            resize = true,
                            forced_height = 50,
                            vertical_fit_policy = "auto",
                            widget = wibox.widget.imagebox
                        },
                        margins = 5,
                        widget = wibox.container.margin
                    },
                    {
                        {
                            {
                                markup = "<b>" .. notification.title .. "</b>",
                                valign = "center",
                                widget = wibox.widget.textbox
                            },
                            left = 5,
                            right = 5,
                            widget = wibox.container.margin
                        },
                        {
                            {
                                text = notification.text,
                                valign = "center",
                                widget = wibox.widget.textbox
                            },
                            left = 5,
                            right = 5,
                            widget = wibox.container.margin
                        },
                        layout = wibox.layout.align.vertical
                    },
                    layout = wibox.layout.fixed.horizontal
                },
                widget = wibox.container.background,
                buttons = gears.table.join(
                    awful.button({ }, 1, function(t) 
                        recent_notifications.remove(i)
                        updateNotifications()
                    end)
                )
            }
            table.insert(widgets, widget)
        end

        ns.children = widgets
    end

    local bg = wibox.widget {
        {
            nil,
            {
                ns,
                bg = "#353d4a",
                widget = wibox.container.background
            },
            {
                button("Silent", os.getenv("HOME").."/.config/awesome/resources/images/icons/DND.svg", getDNDState, setDNDState),
                button("Clear", os.getenv("HOME").."/.config/awesome/resources/images/icons/close.svg", function() return false end, function() recent_notifications.clear() updateNotifications() end),
                layout = wibox.layout.flex.horizontal
            },
            layout = wibox.layout.align.vertical
        },
        widget = wibox.container.background
    }

    naughty.connect_signal("added", function(notification)
        updateNotifications()
    end)
    updateNotifications()

    return bg
end