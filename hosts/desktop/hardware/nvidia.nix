{ config, pkgs, ... }: {
    hardware.nvidia = {
        package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
        open = true;
        modesetting.enable = true;
    };
    services.xserver.videoDrivers = [ "nvidia" ];
    boot.blacklistedKernelModules = ["i2c_nvidia_gpu"];
    environment.sessionVariables = rec {
        WLR_NO_HARDWARE_CURSORS = "1";
    };
}
