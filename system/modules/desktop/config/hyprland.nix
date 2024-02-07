{pkgs, lib}: {
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    hardware.sensor.iio.enable = true;
}
