{ config, pkgs, ... }: {
    imports = [
        ../../nixos/overlays/iptsd.nix
    ];    
    # System packages common to all machines
    environment.systemPackages = with pkgs; [
        iptsd

        (pkgs.callPackage ../../custom/packages/iio-hyprland/default.nix {}) 

        rnote

        brightnessctl
    ];
}
