local naughty = require("naughty")

naughty.recent_notifications = {}

return {
    get = function()
        return naughty.recent_notifications
    end,
    add = function(n)
        if not naughty.recent_notifications then
            naughty.recent_notifications = {}
        end
        table.insert(naughty.recent_notifications, 1, n)
    end,
    remove = function(n)
        if not naughty.recent_notifications then
            naughty.recent_notifications = {}
        end
        table.remove(naughty.recent_notifications, n)
    end,
    clear = function()
        naughty.recent_notifications = {}
    end
}