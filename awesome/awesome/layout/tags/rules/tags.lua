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
                    "Code"
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
        return {
            rule_any = { 
                class = {
                    "dolphin-emu"
                },
                name = {
                    "Steam"
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