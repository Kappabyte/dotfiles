{ config, pkgs, ... }: {
    imports = [
        ../../overlays/iptsd.nix
    ];    
    # System packages common to all machines
    environment.systemPackages = with pkgs; [
        iptsd

        (pkgs.callPackage ../../packages/iio-hyprland/default.nix {}) 

        rnote

        brightnessctl
    ];
}
