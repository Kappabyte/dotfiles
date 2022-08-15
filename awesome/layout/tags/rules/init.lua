local awful = require("awful")

local default = require(... .. ".default")
local floating = require(... .. ".floating")
local titlebars = require(... .. ".titlebars")
local tags = require(... .. ".tags")

awesome.register_xproperty("STEAM_GAME", "number")

awful.rules.rules = {
    -- All clients will match this rule.
    default.default(),
    default.terminal(),
    -- Floating clients.
    floating(),

    -- Add titlebars to normal clients and dialogs
    titlebars(),

    -- Add Tag Rules
    tags.web(),
    tags.code(),
    tags.social(),
    tags.files(),
    tags.games(),
    tags.music(),
    tags.extra1(),
    tags.extra2(),
    tags.extra3(),
}