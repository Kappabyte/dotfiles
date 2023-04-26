{ lib, inputs, pkgs, user, home-manager, ... }: let
settings = ''
'';
in {
    imports = [
        (import ../../common/config/hyprland {system-settings = settings;})
    ];
}
