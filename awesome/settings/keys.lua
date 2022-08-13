local keys = {}

--   ██████  ██       ██████  ██████   █████  ██      
--  ██       ██      ██    ██ ██   ██ ██   ██ ██      
--  ██   ███ ██      ██    ██ ██████  ███████ ██      
--  ██    ██ ██      ██    ██ ██   ██ ██   ██ ██      
--   ██████  ███████  ██████  ██████  ██   ██ ███████ 
--
-- Edit these keys to change global settings related to keybinds.
--

keys.modKey = "Mod4"

--  ██████ ██      ██ ███████ ███    ██ ████████     ██   ██ ███████ ██    ██ ███████ 
-- ██      ██      ██ ██      ████   ██    ██        ██  ██  ██       ██  ██  ██      
-- ██      ██      ██ █████   ██ ██  ██    ██        █████   █████     ████   ███████ 
-- ██      ██      ██ ██      ██  ██ ██    ██        ██  ██  ██         ██         ██ 
--  ██████ ███████ ██ ███████ ██   ████    ██        ██   ██ ███████    ██    ███████ 
--
-- Edit these keys to change the keybinds that act on individual windows.
--

keys.close = {
    mod = { keys.modKey },
    key = "q"
}

keys.fullscreen = {
    mod = { keys.modKey },
    key = "f"
}

keys.moveToMaster = {
    mod = { keys.modKey },
    key = "space"
}

keys.changeScreen = {
    mod = { keys.modKey },
    key = "o"
}

keys.minimize = {
    mod = { keys.modKey },
    key = "n"
}

keys.maximize = {
    mod = { keys.modKey },
    key = "m"
}







-- Internal

return keys