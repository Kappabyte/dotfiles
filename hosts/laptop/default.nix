{ config, pkgs, ... }: {
    imports = [
        ../common

        # Import custom services
        ../../services/iptsd.nix

        ## Install system specific modules
        ./packages.nix

        ## Set up the hardware
        ./hardware/hardware-configuration.nix

        ## Enable users
        ../../users/avery.nix
    ];

    services.xserver.libinput.touchpad.naturalScrolling = true;
    
    surface.ipts.enable = true;

    nix.settings.trusted-users = [ "root" "avery" ];
    services.openssh.enable = true;
    services.openssh.settings.PermitRootLogin = "yes";
    ## Set the hostname
    networking.hostName = "averys-laptop";
}
