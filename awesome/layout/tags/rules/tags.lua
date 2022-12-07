-- Place all steam games on the games tab
-- client.connect_signal("manage", function (c)
--     if(c:get_xproperty("STEAM_GAME")) then
--         c:tags {
--             c.screen.tags[5]
--         }
--     end
-- end)
local awful = require("awful")
local naughty = require("naughty")

return {
    web = function()
        return {
            rule_any = { 
                class = { 
                    "firefox"
                }
            },
            properties = { 
                tag = "web" 
            } 
        }
    end,
    code = function()
        return {
            rule_any = { 
                class = { 
                    "jetbrains-idea-ce",
                    "Code",
                    "code-oss"
                }
            },
            properties = { 
                tag = "code" 
            } 
        }
    end,
    social = function()
        return {
            rule_any = { 
                class = { 
                    "discord"
                }
            },
            properties = { 
                tag = "social" 
            } 
        }
    end,
    files = function()
        return {
            rule_any = { 
                class = {
                    "Thunar"
                }
            },
            properties = { 
                tag = "files" 
            } 
        }
    end,
    games = function()
        awful.rules.add_rule_source("steam", function (c, props, callback) 
            if(c:get_xproperty("STEAM_GAME")) then
                props.tag = "games"
                props.immune = true
            end
        end)
        return {
            rule_any = { 
                class = {
                    "dolphin-emu",
                    "Steam",
                    "streaming_client",
                    "PolyMC",
                    "org-polymc-EntryPoint",
                    "Minecraft.*"
                }
            },
            properties = { 
                tag = "games" 
            } 
        }
    end,
    music = function()
        return {
            rule_any = { 
                class = {
                }
            },
            properties = { 
                tag = "music" 
            } 
        }
    end,
    extra1 = function()
        return {
            rule_any = { 
                class = {
                }
            },
            properties = { 
                tag = "1"
            } 
        }
    end,
    extra2 = function()
        return {
            rule_any = { 
                class = {
                }
            },
            properties = { 
                tag = "2" 
            } 
        }
    end,
    extra3 = function()
        return {
            rule_any = { 
                class = {
                }
            },
            properties = { 
                tag = "3" 
            } 
        }
    end,
}