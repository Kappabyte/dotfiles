{ lib, pkgs, inputs, ... }: {
    wayland.windowManager.hyprland = {
        plugins = [
            inputs.hyprgrass.packages.${pkgs.system}.default
        ];
        settings = {
            monitor = [
                "eDP-1,2736x1824,0x0,2"
            ];
            exec-once = [
                "iio-hyprland"
                "/home/avery/.config/hypr/rotate.sh"
            ];
            bindl = [
                ",switch:on:Lid Switch,exec,/home/avery/.config/hypr/lock.sh"
                ",switch:on:Lid Switch,exec,${pkgs.brightnessctl}/bin/brightnessctl -s"
                ",switch:on:Lid Switch,exec,${pkgs.brightnessctl}/bin/brightnessctl s 0%"
                ",switch:off:Lid Switch,exec,${pkgs.brightnessctl}/bin/brightnessctl -r"
            ];
            bind = [
                ",edge:u:d,hycov:toggleoverview"
            ];
            plugin = {
                touch_gestures = {
                    sensitivity = 4.0;
                    workspace_swipe_fingers = 3;
                    long_press_delay = 400;
                };
            };
        };
    };

}
