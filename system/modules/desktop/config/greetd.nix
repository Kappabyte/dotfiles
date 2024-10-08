{lib, pkgs, config, ...}: let 
    sessions = lib.strings.concatStringsSep ":" (map (package: "${package}/share/wayland-sessions")(config.properties.wayland-sessions.session-list));
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
