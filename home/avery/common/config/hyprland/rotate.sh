#!/bin/sh
# Script to reload eww whenever
# the monitor configuration changes

last_monitors=$(hyprctl monitors | grep transform)

update() {
    if [[ $1 == "activelayout>>gpio-keys,English" ]]; then
        new_monitors=$(hyprctl monitors | grep transform)
        if [[ $new_monitors != $last_monitors ]]; then
            last_monitors=$new_monitors

            eww close-all 2> /dev/null 1> /dev/null
            eww open-many bar_left bar_right 2> /dev/null 1> /dev/null
        fi
    fi
}

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r event; do 
update $event
done
