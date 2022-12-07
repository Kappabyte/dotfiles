return function()
    return {
        rule_any = {
            type = { 
                "normal", 
                "dialog" 
            }
        }, 
        except_any = {
            class = {
                "com.github.neithern.g4music"
            }
        },
        properties = { 
            titlebars_enabled = true
        }
    }
end
