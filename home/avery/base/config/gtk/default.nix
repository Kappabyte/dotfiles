{ config, lib, inputs, pkgs, user, home-manager, ... }: {
    gtk = {
        enable = true;
        gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
        theme = {
            name = "adw-gtk3-dark";
            package = pkgs.adw-gtk3;
        };
        iconTheme = {
            name = "Oranchelo";
            package = pkgs.oranchelo-icon-theme;
        };
    };

    xdg.configFile."gtk-3.0/gtk.css".source = ./Adwaita-One-Dark/colors/gtk-dark.css;
    xdg.configFile."gtk-4.0/gtk.css".source = ./Adwaita-One-Dark/colors/gtk-dark.css;
    #home.file.".themes/adw-gtk3-dark/gtk-2.0" = {
    #    recursive = true;
    #    source = ./Adwaita-One-Dark/gtk-2.0;
    #};
}
