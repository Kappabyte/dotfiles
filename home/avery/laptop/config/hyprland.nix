{ lib, inputs, pkgs, user, home-manager, ... }: let
settings = ''
monitor=eDP-1,2736x1824,0x0,2

exec-once=iio-hyprland
exec-once=/home/avery/.config/hypr/rotate.sh
'';
in {
    imports = [
        (import ../../common/config/hyprland {system-settings = settings;})
    ];
}
