{ config, pkgs, ... }: {
    imports = [
        # Set up hardware
        ./hardware/network.nix

        # Global packages
        ./packages.nix

        # Enable global packages
        ../../nixos/packages/dbus.nix
        ../../nixos/packages/fish.nix
        ../../nixos/packages/hyprland.nix
        ../../nixos/packages/pipewire.nix
        ../../nixos/packages/sddm.nix
        ../../nixos/packages/xdg.nix
        ../../nixos/packages/xorg.nix
        ../../nixos/packages/plymouth.nix
        ../../nixos/packages/ssh.nix
        ../../nixos/packages/bluetooth.nix
        ../../nixos/packages/xpadneo.nix
        ../../nixos/packages/syncthing.nix
        ../../nixos/packages/usbmuxd.nix
    ];
        

    # Set the timezone
    time.timeZone = "America/Edmonton";

    # Enable servies common to all machines
    services.gvfs.enable = true;
    programs.dconf.enable = true;

    security.pam.services.swaylock = {};

    # Enable nix flake support
    nix = {
        package = pkgs.nixFlakes;
        extraOptions = "experimental-features = nix-command flakes";
    };
    boot.initrd.systemd.enable = true;
    boot.kernelParams = ["quiet"];
    # Set the state version
    system.stateVersion = "22.11";


}
