{ config, pkgs, ... }: {
    programs.hyprland = {
        enable = true;
        enableNvidiaPatches = true;
        # xwayland.enable = false;
    };

    hardware.sensor.iio.enable = true;
}
