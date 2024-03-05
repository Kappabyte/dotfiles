{ config, lib, pkgs, modulesPath, ... }: {
    boot.initrd.kernelModules = [ "amdgpu" ];
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "amdgpu" ];
    hardware.opengl.extraPackages = with pkgs; [
        amdvlk
    ];
    # For 32 bit applications 
    hardware.opengl.extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
    ];
}
