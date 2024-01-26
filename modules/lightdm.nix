{ config, pkgs, ... }: {
    services.xserver.enable = true;
    hardware.opengl.enable = true;

    services.xserver.displayManager.lightdm = {
        greeters.slick.enable = true;
        enable = true;
    };

}
