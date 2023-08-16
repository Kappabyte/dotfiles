{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.kitty = {
        enable = true;
        theme = "One Dark";
        font.name = "JetBrainsMono Nerd Font";
        shellIntegration.enableFishIntegration = true;
        shellIntegration.enableBashIntegration = true;
        settings = {
            background = "#282c33";
            background_opacity = "0.8";
        };
    };
}
