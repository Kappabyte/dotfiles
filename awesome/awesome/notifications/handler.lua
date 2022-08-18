local naughty = require("naughty")
local awful = require("awful")

local recent_notifications = require("notifications.recent")

naughty.connect_signal("added", function(notification)
    recent_notifications.add(notification)
end)