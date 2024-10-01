{ lib, pkgs, inputs, ... }: {
    wayland.windowManager.hyprland = {
        settings = {
            monitor = [
                "eDP-1,2736x1824,0x0,2,vrr,1"
                ",preferred,auto,1"
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
        };
    };

}
