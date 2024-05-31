{ pkgs, lib, config }: let 
    wallpaper = ./wallpaper.jpg;
    sessions = (if config.module.desktop.enable == true then "${pkgs.hyprland}/share/wayland-sessions:" else "") + 
               (if config.module.games.enable == true then "${(pkgs.callPackage ../../games/packages/steam-gamescope {})}/share/wayland-sessions:" else "");
in {
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${pkgs.greetd.tuigreet}/bin/tuigreet --issue --time --remember --remember-session --user-menu --sessions ${sessions}";
                user = "greeter";
            };
        };
    };
}
