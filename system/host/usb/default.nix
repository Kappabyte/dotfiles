{ config, pkgs, ... }: {
    imports = [
        # Set up hardware
        ./hardware/network.nix

        # Global modules
        ./modules.nix

        # Set up the hardware
        ./hardware/hardware-configuration.nix

        # Enable global modules
        ../../modules/dbus.nix
        ../../modules/fish.nix
        ../../modules/hyprland.nix
        ../../modules/pipewire.nix
        ../../modules/sddm.nix
        ../../modules/xdg.nix
        ../../modules/xorg.nix
        ../../modules/plymouth.nix
        ../../modules/ssh.nix
        ../../modules/bluetooth.nix

        # Add Users
        ../../users/avery.nix
    ];
    networking.hostName = "avery-usb";

    boot.loader = {
	efi = {
	    canTouchEfiVariables = false;
	};
	grub = {
	    efiSupport = true;
	    efiInstallAsRemovable = false;
	    device = "/dev/disk/by-uuid/A253-2937";
	};
    };

    # Set the timezone
    time.timeZone = "America/Edmonton";

    # Enable servies common to all machines
    services.gvfs.enable = true;
    programs.dconf.enable = true;

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
