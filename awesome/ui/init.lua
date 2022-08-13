local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local menubar = require("menubar")

local titlebars = require(... .. ".misc.titlebars")

local tagbar = require(... .. ".tagbar")
local appbar = require(... .. ".appbar")
local settingspane = require(... .. ".settingspane")
local coverpane = require(... .. ".coverpane")

local naughty = require("naughty")

awful.screen.connect_for_each_screen(function(s)

    local menu_open = false

    s.coverpane = coverpane(s)
    s.appbar = appbar(s, 48)
    s.tagbar = tagbar(s)
    s.settingspane = settingspane(s)

    s:connect_signal("menu::toggle", function()
        if menu_open then
            s.appbar.setOffset(48)
            s.tagbar.setOffset(0)
            s.settingspane.setVisible(false)
            s.coverpane.setVisible(false)
        else
            s.appbar.setOffset(250 + 48)
            s.tagbar.setOffset(250)
            s.settingspane.setVisible(true)
            s.coverpane.setVisible(true)
        end
        menu_open = not menu_open
    end)

    s:connect_signal("menu::open", function()
        s.appbar.setOffset(250 + 48)
        s.tagbar.setOffset(250)
        s.settingspane.setVisible(true)
        s.coverpane.setVisible(true)
        menu_open = true
    end)

    s:connect_signal("menu::close", function()
        s.appbar.setOffset(48)
        s.tagbar.setOffset(0)
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
    c.first_tag.fullscreenMode = c.fullscreen
    updateBarsVisibility()
end)

client.connect_signal('unmanage', function(c)
    if c.fullscreen then
        c.screen.selected_tag.fullscreenMode = false
        updateBarsVisibility()
    end
end)