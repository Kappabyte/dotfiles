-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.config.defaults.ontop = true
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime erroNrs after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) .. "\n\n" .. debug.traceback() })
        in_error = false
    end)
end
-- }}}

local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), "default")
beautiful.init(theme_path)
beautiful.systray_max_rows = 2

require("keys.global")
require("notifications.handler")

require("layout")
require("ui")

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)
end)

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- }}}

awful.spawn.with_shell("/home/avery/.config/awesome/autorun.sh")

awful.spawn.with_shell("picom --experimental-backends --backend glx")

awful.spawn.with_shell("pactl set-default-sink main-mixer-in")

awful.spawn.with_shell("pw-link -P main-mixer-out:capture_FL alsa_output.pci-0000_2f_00.4.analog-stereo.3:playback_FL")
awful.spawn.with_shell("pw-link -P main-mixer-out:capture_FR alsa_output.pci-0000_2f_00.4.analog-stereo.3:playback_FR")
awful.spawn.with_shell("pw-link -P alsa_input.pci-0000_2f_00.4.analog-stereo.2:capture_FL share-in:playback_FL")
awful.spawn.with_shell("pw-link -P alsa_input.pci-0000_2f_00.4.analog-stereo.2:capture_FR share-in:playback_FR")
