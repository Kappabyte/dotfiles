{ config, pkgs, ... }: {
    
    # System packages common to all machines
    environment.systemPackages = with pkgs; [
        iptsd
        obsidian

        (pkgs.callPackage ../../custom/packages/iio-hyprland/default.nix {}) 

        rnote
        zoom-us

        brightnessctl
    ];
}
