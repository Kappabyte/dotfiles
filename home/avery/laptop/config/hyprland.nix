{ lib, inputs, pkgs, user, home-manager, ... }: let
settings = ''
monitor=eDP-1,2736x1824,0x0,2

exec-once=iio-hyprland
exec-once=/home/avery/.config/hypr/rotate.sh

bindl=,switch:on:Lid Switch,exec,/home/avery/.config/hypr/lock.sh
bindl=,switch:on:Lid Switch,exec,brightnessctl -s
bindl=,switch:on:Lid Switch,exec,brightnessctl s 0%
bindl=,switch:off:Lid Switch,exec,brightnessctl -r
'';
in {
    imports = [
        (import ../../common/config/hyprland {system-settings = settings;})
    ];
}
