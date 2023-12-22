{ config, pkgs, ... }: {
    programs.hyprland = {
        enable = true;
        xwayland.enable = false;
    };

    hardware.sensor.iio.enable = true;
}
