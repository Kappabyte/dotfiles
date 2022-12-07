local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local titlebars = require(... .. ".misc.titlebars")

local desktopicons = require(... .. ".desktop.icons")
local tagbar = require(... .. ".tagbar")
local appbar = require(... .. ".appbar")
local settingspane = require(... .. ".settingspane")
local coverpane = require(... .. ".coverpane")
local rubato = require("lib.rubato")

awful.screen.connect_for_each_screen(function(s)

    local openCloseAnimation = rubato.timed {
        duration = 0.2,
        pos = 0;
    }

    local menu_open = false

    s.desktopicons = desktopicons(s)
    s.coverpane = coverpane(s)
    s.appbar = appbar(s, 48)
    s.tagbar = tagbar(s)
    s.settingspane = settingspane(s)

    s:connect_signal("menu::toggle", function()
        if menu_open then
            openCloseAnimation.target = 0
            s.settingspane.setVisible(false)
            s.coverpane.setVisible(false)
        else
            openCloseAnimation.target = 250
            s.settingspane.setVisible(true)
            s.coverpane.setVisible(true)
        end
        menu_open = not menu_open
    end)

    openCloseAnimation:subscribe(function(pos)
        s.appbar.setOffset(pos + 48)
        s.tagbar.setOffset(pos)
        s.settingspane.setWidth(pos)
    end)

    s:connect_signal("menu::open", function()
        openCloseAnimation.target = 250
        s.settingspane.setVisible(true)
        s.coverpane.setVisible(true)
        menu_open = true
    end)

    s:connect_signal("menu::close", function()
        openCloseAnimation.target = 0
        s.settingspane.setVisible(false)
        s.coverpane.setVisible(false)
        menu_open = false
    end)

    for s in screen do
        for i,tag in ipairs(s.tags) do
            tag:connect_signal("property::selected", function(c)
                updateBarsVisibility()
            end)
        end
    end
end)

-- Hide bars when app go fullscreen
function updateBarsVisibility()
    for s in screen do
        if s.selected_tags then
            local fullscreen = false
            for i,tag in ipairs(s.selected_tags) do
                if tag.fullscreenMode then
                    fullscreen = true
                end
            end
            -- Order matter here for shadow
            s.appbar.visible = not fullscreen
            if s.tagbar then
                s.tagbar.visible = not fullscreen
            end
        end
    end
end

client.connect_signal("property::fullscreen", function(c)
    if c.first_tag then
        c.first_tag.fullscreenMode = c.fullscreen
        updateBarsVisibility()
    end
end)

client.connect_signal('manage', function(c)
    if c.fullscreen then
        c.screen.selected_tag.fullscreenMode = true
        updateBarsVisibility()
    end
end)

client.connect_signal('unmanage', function(c)
    if c.fullscreen then
        c.screen.selected_tag.fullscreenMode = false
        updateBarsVisibility()
    end
end)