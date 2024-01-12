{ config, lib, inputs, pkgs, user, home-manager, ... }: {
    gtk = {
        enable = true;
        gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
        theme = {
            name = "One-Dark";
            package = (pkgs.callPackage ../../../../packages/onedark-gtk/default.nix {}); 
        };
        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme.override {
                color = "cyan";
            };
        };
        cursorTheme = {
            name = "Catppuccin-Mocha-Light-Cursors";
            size = 48;
        };
    };
}
