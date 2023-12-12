{ config, pkgs, ... }: {
    imports = [
        ../common

        # Import custom services
        ../../services/mount.nix

        ## Install system specific modules
        ./packages.nix

        ## Set up the hardware
        ./hardware/hardware-configuration.nix
        ./hardware/nvidia.nix

        ## Enable system specific modules
        ../../modules/steam.nix

        ## Enable users
        ../../users/avery.nix
    ];

    ## Set the hostname
    networking.hostName = "averys-desktop";

    ## Enable the automount service
    services.automount.enable = true;

    ## Disable the second monitor when logging in
    services.xserver.displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-0 --off
    '';
}
