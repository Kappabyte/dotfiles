{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.kitty = {
        enable = true;
        theme = "Catppuccin-Mocha";
        font.name = "JetBrainsMono Nerd Font";
    };
}