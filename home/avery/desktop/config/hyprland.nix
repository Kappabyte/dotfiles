{ lib, inputs, pkgs, user, home-manager, ... }: let
settings = ''
monitor=DP-1, 2560x1440@165, 2560x0, 1
monitor=DP-2, 2560x1440@165, 0x0, 1

workspace = DP-1, 2
workspace = DP-2, 1
'';
in {
    imports = [
        (import ../../common/config/hyprland {system-settings = settings;})
    ];
}
