{ lib, inputs, pkgs, user, home-manager, ... }: {
    imports = [
        # Configuration Files
        ./config/hyprland.nix
    ];
}
