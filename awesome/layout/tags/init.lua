local awful = require("awful")

awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "web", "code", "social", "files", "games", "music", "1", "2", "3"}, s, awful.layout.layouts[1])
end)