{ lib, inputs, pkgs, user, home-manager, ... }: let
settings = {
    left = ["wlr/workspaces" "hyprland/submap"];
    center = ["hyprland/window"];
    right = ["tray" "battery" "pulseaudio" "clock"];
};
in {
    imports = [
        (import ../../common/config/waybar.nix {pkgs = pkgs; system-settings = settings;})
    ];
}
