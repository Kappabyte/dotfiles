{ lib, inputs, pkgs, user, home-manager, ... }: {
    gtk = {
        enable = true;
        theme = {
            name = "Catppuccin-Mocha-Standard-Teal-Dark";
            package = pkgs.catppuccin-gtk.override {
                accents = [ "teal" ];
                variant = "mocha";
            };
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
