{ lib, ... }: let 
wallpaper = ./wallpaper.jpg;
in {
    programs.regreet = {
        enable = true;
        cageArgs= ["-s" "-m" "last"];
        settings = {
            background = {
                path = "${wallpaper}";
                fit = "Cover";
            };
            gtk = {
                application_prefer_dark_theme = true;
                theme_name = "adw-gtk3-dark";
            };
        };
    };
}
