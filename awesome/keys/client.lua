local awful = require("awful")
local gears = require("gears")

local settings = require("settings.keys")

modkey = "Mod4"

local toggleFullscreen = function (c) 
    c.fullscreen = not c.fullscreen 
    c:raise() 
end

local close = function (c) 
    c:kill()                         
end

local moveToMaster = function (c) 
    c:swap(awful.client.getmaster()) 
end

local changeScreen = function (c) 
    c:move_to_screen()               
end

local minimize = function (c)
    c.minimized = true
end

local maximize = function (c)
    c.maximized = not c.maximized
    c:raise()
end

return {
    clientkeys = gears.table.join(
        -- Toggle Full Screen
        awful.key(settings.fullscreen.mod,      settings.fullscreen.key,    toggleFullscreen,   {description = "Toggle Fullscreen", group = "client"}),
        awful.key(settings.close.mod,           settings.close.key,         close,              {description = "Close", group = "client"}),
        awful.key(settings.moveToMaster.mod,    settings.moveToMaster.key,  moveToMaster,       {description = "Move to Master", group = "client"}),
        awful.key(settings.changeScreen.mod,    settings.changeScreen.key,  changeScreen,       {description = "Change Screen", group = "client"}),
        awful.key(settings.minimize.mod,        settings.minimize.key,      minimize,           {description = "Minimize", group = "client"}),
        awful.key(settings.maximize.mod,        settings.maximize.key,      maximize,           {description = "Maximize/Restore", group = "client"})
    ),
    clientbuttons = gears.table.join(
        awful.button({ }, 1, function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end)
    )
}