{ config, ... }: {
    programs.kitty = {
        enable = true;
        font.name = "JetBrainsMono Nerd Font";
        shellIntegration.enableFishIntegration = true;
        shellIntegration.enableBashIntegration = true;
    };
}
