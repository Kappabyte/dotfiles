local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local modkey = "Mod4"

local nextLayout = function()
    awful.layout.inc(1)
end

local focusNext = function()
    awful.client.focus.byidx(1)
end

local focusPrev = function()
    awful.client.focus.byidx(-1)
end

local swapNext = function () 
    awful.client.swap.byidx(  1)    
end

local swapPrev = function () 
    awful.client.swap.byidx( -1)    
end

local focusNextScreen = function () 
    awful.screen.focus_relative( 1) 
end

local focusPrevScreen = function () 
    awful.screen.focus_relative(-1) 
end

local goBack = function ()
    awful.client.focus.history.previous()
    if client.focus then
        client.focus:raise()
    end
end

local spawnTerminal = function () 
    awful.spawn("kitty") 
end

local increaseMasterWidth = function () 
    awful.tag.incmwfact( 0.05)          
end

local decreaseMasterWidth = function () 
    awful.tag.incmwfact( 0.05)          
end

local increaseMaster = function () 
    awful.tag.incnmaster( 1, nil, true) 
end

local decreaseMaster = function () 
    awful.tag.incnmaster(-1, nil, true) 
end

local increaseColumns = function () 
    awful.tag.incncol( 1, nil, true)    
end

local decreaseColumns = function () 
    awful.tag.incncol(-1, nil, true)    
end

local selectNext = function () 
    awful.layout.inc( 1)                
end

local selectPrev = function () 
    awful.layout.inc(-1)                
end

local restore = function ()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
      c:emit_signal(
          "request::activate", "key.unminimize", {raise = true}
      )
    end
end

local applicationMenu = function()
    awful.screen.focused():emit_signal("menu::open")
    awful.spawn.with_shell("~/.config/awesome/ui/rofi/launcher.sh 0.2") 
end

local settingsPane = function()
    awful.spawn.with_shell("pkill rofi")
    awful.screen.focused():emit_signal("menu::toggle")
end

local bluetooth = function()
    awful.screen.focused():emit_signal("menu::open")
    awful.spawn.with_shell("~/.config/awesome/ui/rofi/bluetooth.sh 0.2")
end


-- {{{ Key bindings
globalkeys = gears.table.join(

    awful.key({ modkey, "Control" }, "q",       hotkeys_popup.show_help,    {description = "Show Help",                             group = "awesome"}),
    awful.key({ modkey,           }, "Left",    awful.tag.viewprev,         {description = "View Previous",                         group = "tag"}),
    awful.key({ modkey,           }, "Right",   awful.tag.viewnext,         {description = "View Next",                             group = "tag"}),
    awful.key({ modkey,           }, "Escape",  awful.tag.history.restore,  {description = "Go Back",                               group = "tag"}),
    awful.key({ modkey,           }, "j",       focusNext,                  {description = "Focus Next By Index",                   group = "client"}),
    awful.key({ modkey,           }, "k",       focusPrev,                  {description = "Focus Previous by Index",               group = "client"}),
    -- Layout manipulation
    awful.key({ modkey,           }, "x",       nextLayout,                 {description = "Next Layout",                           group = "client"}),
    awful.key({ modkey, "Shift"   }, "j",       swapNext,                   {description = "Swap with Next Client by Index",        group = "client"}),
    awful.key({ modkey, "Shift"   }, "k",       swapPrev,                   {description = "Swap with Previous Client by Index",    group = "client"}),
    awful.key({ modkey, "Control" }, "j",       focusNextScreen,            {description = "Focus the Next Screen",                 group = "screen"}),
    awful.key({ modkey, "Control" }, "k",       focusPrevScreen,            {description = "Focus the Previous Screen",             group = "screen"}),
    awful.key({ modkey,           }, "u",       awful.client.urgent.jumpto, {description = "Jump to Urgent Client",                 group = "client"}),
    awful.key({ modkey,           }, "Tab",     goBack,                     {description = "Go Back",                               group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return",  spawnTerminal,              {description = "open a terminal",                       group = "launcher"}),
    awful.key({ modkey, "Control" }, "r",       awesome.restart,            {description = "reload awesome",                        group = "power"}),
    awful.key({ modkey, "Shift"   }, "q",       awesome.quit,               {description = "quit awesome",                          group = "power"}),
    awful.key({ modkey,           }, "l",       increaseMasterWidth,        {description = "increase master width factor",          group = "layout"}),
    awful.key({ modkey,           }, "h",       decreaseMasterWidth,        {description = "decrease master width factor",          group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",       increaseMaster,             {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",       decreaseMaster,             {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",       increaseColumns,            {description = "increase the number of columns",        group = "layout"}),
    awful.key({ modkey, "Control" }, "l",       decreaseColumns,            {description = "decrease the number of columns",        group = "layout"}),
    awful.key({ modkey,           }, "z",       selectNext,                 {description = "select next",                           group = "layout"}),
    awful.key({ modkey, "Shift"   }, "z",       selectPrev,                 {description = "select previous",                       group = "layout"}),

    awful.key({ modkey, "Control" }, "n",       restore,                    {description = "restore minimized",                     group = "client"}),
    -- Menubar
    awful.key({ modkey            }, "p",       applicationMenu,            {description = "Application Launcher",                  group = "launcher"}),
    -- settings
    awful.key({ "Mod4"            }, "s",       settingsPane,               {description = "Open Settings Pane",                    group = "launcher"}),
    awful.key({ "Mod4"            }, "b",       bluetooth,                  {description = "Open Bluetooth Settings",               group = "launcher"})
)



-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do

    local viewTag = function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
           tag:view_only()
        end
    end

    local toggleTag = function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
           awful.tag.viewtoggle(tag)
        end
    end

    local moveToTag = function ()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
                client.focus:move_to_tag(tag)
            end
       end
    end

    local toggleOnTag = function ()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
                client.focus:toggle_tag(tag)
            end
        end
    end

    globalkeys = gears.table.join(globalkeys,
        awful.key({ modkey                      }, "#" .. i + 9,    viewTag,        {description = "Show Tag #"..i,              group = "tag"}),
        awful.key({ modkey, "Control"           }, "#" .. i + 9,    toggleTag,      {description = "Toggle Tag #" .. i,          group = "tag"}),
        awful.key({ modkey, "Shift"             }, "#" .. i + 9,    moveToTag,      {description = "Move Window to Tag #"..i,    group = "tag"}),
        awful.key({ modkey, "Control", "Shift"  }, "#" .. i + 9,    toggleOnTag,    {description = "Toggle Window Tag #" .. i,   group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end)
)

-- Set keys
root.keys(globalkeys)