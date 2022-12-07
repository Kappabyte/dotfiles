---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font          = "Noto Sans 10"

theme.bg_dark     = "#232830"
theme.bg_light      = "#2e3540"
theme.bg_mid        = "#272c36"

theme.fg_dark    = "#aaaaaa"
theme.fg_light      = "#ffffff"

theme.highlight_dark     = "#47e686"
theme.highlight_light    = "#93fabc"

theme.useless_gap   = dpi(2)

theme.titlebar_bg_normal = theme.bg_light
theme.titlebar_bg_focus = theme.bg_dark
theme.titlebar_fg_normal = theme.fg_dark
theme.titlebar_fg_focus = theme.fg_light

theme.wallpaper = "~/.config/awesome/themes/default/bkg.png"

theme.icon_theme = "Papirus"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80