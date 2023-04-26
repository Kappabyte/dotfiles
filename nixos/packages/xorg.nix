{ config, pkgs, ... }: {
    services.xserver.enable = true;
    hardware.opengl.enable = true;
}