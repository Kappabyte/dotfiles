#!/bin/sh
monitor=$(($1 + 1))

#output eww widget
count=0

update() {
    workspaces=( $(hyprctl workspaces | grep "workspace ID" | cut -d'(' -f2- | cut -d')' -f-1) )

    declare -A workspace_order=()
    for index in "${!workspaces[@]}"
    do
        workspace_order+=(["${workspaces[${index}]}"]="$((index + 1))")
    done

    workspaces=( $(hyprctl workspaces | grep "workspace ID" | cut -d'(' -f2- | cut -d')' -f-1 | sort) )

    monitor_workspace=$(hyprctl monitors | grep "active workspace:" | cut -d'(' -f2- | cut -d')' -f-1 | head -n ${monitor} | tail -n 1)

    widget="(box :class \"workspaces\" :orientation \"h\" "
    for index in "${!workspaces[@]}"
    do
        idx=${workspace_order[${workspaces[${index}]}]}
        window_count=$(hyprctl workspaces | grep "windows: " | head -n ${idx} | tail -n 1 | cut -d' ' -f2)
        
        icon=""
        if [[ window_count -gt 0 ]]; then
            icon=""
        fi

        classes=""
        if [[ ${workspaces[${index}]} == ${monitor_workspace} ]]; then
            classes="active"
        fi
        widget+="(button :onclick \"hyprctl dispatch moveworkspacetomonitor ${workspaces[${index}]} $((monitor - 1)) && hyprctl dispatch workspace ${workspaces[${index}]}\" :class \"${classes}\" \"${icon}\") "
    done
    widget+=")"

    echo $widget
}

update

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r event; do 
update
done
