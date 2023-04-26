{ config, pkgs, ... }: {
    imports = [
        # Import custom services
        ../../custom/services/mount.nix

        ## Install system specific packages
        ./packages.nix

        ## Set up the hardware
        ./hardware/hardware-configuration.nix

        ## Enable system specific packages
        ../../nixos/packages/steam.nix
        ../../nixos/packages/systemd-boot.nix

        ## Enable users
        ../../nixos/users/avery.nix
    ];

    programs.sway.enable = true;

    ## Set the hostname
    networking.hostName = "averys-desktop";

    ## Enable the automount service
    services.automount.enable = true;

    ## Disable the second monitor when logging in
    services.xserver.displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-0 --off
    '';
}
