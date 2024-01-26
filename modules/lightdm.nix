{ config, pkgs, ... }: {
    services.xserver.enable = true;
    hardware.opengl.enable = true;

    services.xserver.displayManager = {
        defaultSession = "hyprland";
        lightdm = {
#            greeters.slick.enable = true;
            enable = true;
        };

    };
}
