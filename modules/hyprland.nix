{ config, pkgs, ... }: {
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    hardware.sensor.iio.enable = true;
}
