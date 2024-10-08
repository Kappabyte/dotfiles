{ ... }: {
    xdg.configFile."hypr/lock.sh".source = ./lock.sh;

    wayland.windowManager.hyprland.settings = {
        general = {
            gaps_in = 5;
            gaps_out = 20;
            border_size = 2;

            layout = "dwindle";
        };
        decoration = {
            rounding = 5;
            blur = {
                enabled = true;
                size = 5;
                passes = 4;
                xray = false;
                ignore_opacity = false;
                new_optimizations = true;
            };
            drop_shadow = true;
            shadow_range = 0;
            shadow_render_power = 0;
        };
        animations = {
            enabled = true;
            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

            animation = [
                "windows, 1, 7, myBezier"
                "windowsOut, 1, 7, default, popin 80%"
                "border, 1, 10, default"
                "borderangle, 1, 8, default"
                "fade, 1, 7, default"
                "workspaces, 1, 6, default"
            ];
        };
        dwindle = {
            pseudotile = true;
            preserve_split = true;
        };
        layerrule = [
            "blur, ^ags:.*$"
            "ignorezero, ^ags:.*$"
        ];
        windowrulev2 = [
            "float,title:^Unlock Database - KeePassXC$"
            "float,title:^(zoom)$"
            "float,title:^(?!Steam$).*,class:steam"
            "fullscreen,class:gamescope"
            "workspace name:steam,class:gamescope"
            "monitor DP-2,class:gamescope"
            "fullscreen,initialTitle:Steam Big Picture Mode"
            "workspace name:steam,initialTitle:Steam Big Picture Mode"
            "monitor DP-2,initialTitle:Steam Big Picture Mode"
        ];
        windowrule = [
            "noanim,ulauncher"
        ];
    };
}
