{ config, pkgs, ... }: {
    imports = [
        # Set up hardware
        ./hardware/network.nix

        # Global modules
        ./packages.nix

        # Enable global modules
        ../../modules/adb.nix
        ../../modules/systemd-boot.nix
        ../../modules/gnupg.nix
        ../../modules/dbus.nix
        ../../modules/kdeconnect.nix
        ../../modules/upower.nix
        ../../modules/fish.nix
        ../../modules/hyprland.nix
        ../../modules/pipewire.nix
        ../../modules/lightdm.nix
        ../../modules/xdg.nix
        ../../modules/xorg.nix
        ../../modules/plymouth.nix
        ../../modules/ssh.nix
        ../../modules/bluetooth.nix
        ../../modules/xpadneo.nix
        ../../modules/syncthing.nix
        ../../modules/usbmuxd.nix
        ../../modules/thefuck.nix
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
        channel.enable = false;
    };
    boot.initrd.systemd.enable = true;
    boot.kernelParams = ["quiet"];
    # Set the state version
    system.stateVersion = "22.11";


}
