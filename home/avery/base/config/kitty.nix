{ ... }: {
    programs.kitty = {
        enable = true;
        font.name = "JetBrainsMono Nerd Font";
        shellIntegration.enableFishIntegration = true;
        shellIntegration.enableBashIntegration = true;
        settings = {
            background_opacity = "0.9";
        };
    };
}
