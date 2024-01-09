{ config, lib, inputs, pkgs, user, home-manager, ... }: {
    gtk = {
        enable = true;
        gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
        theme = {
            name = "adw-gtk3-dark";
            package = pkgs.adw-gtk3;
        };
        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme.override {
                color = "cyan";
            };
        };
    };

    xdg.configFile."gtk-3.0/gtk.css".source = ./Adwaita-One-Dark/colors/gtk.css;
    xdg.configFile."gtk-4.0/gtk.css".source = ./Adwaita-One-Dark/colors/gtk.css;
}
