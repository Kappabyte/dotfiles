{ ... }: let
    mainMod = "SUPER";
in{
    wayland.windowManager.hyprland.settings.bind = [
        "${mainMod}, return, exec, kitty"
        "${mainMod}, C, killactive, "
        "${mainMod}, L, exec, /home/avery/.config/hypr/lock.sh"
        "${mainMod}, V, togglefloating, "
        "${mainMod}, J, togglesplit, # dwindle"
        "${mainMod}, F, fullscreen,"

        # Move focus with mainMod + arrow keys
        "${mainMod}, left, movefocus, l"
        "${mainMod}, right, movefocus, r"
        "${mainMod}, up, movefocus, u"
        "${mainMod}, down, movefocus, d"

        # Open Application Launcher
        "${mainMod}, P, exec, ulauncher-toggle"

        # Switch workspaces with mainMod + [0-9]
        "${mainMod}, 1, moveworkspacetomonitor, 1 current"
        "${mainMod}, 1, workspace, 1"
        "${mainMod}, 2, moveworkspacetomonitor, 2 current"
        "${mainMod}, 2, workspace, 2"
        "${mainMod}, 3, moveworkspacetomonitor, 3 current"
        "${mainMod}, 3, workspace, 3"
        "${mainMod}, 4, moveworkspacetomonitor, 4 current"
        "${mainMod}, 4, workspace, 4"
        "${mainMod}, 5, moveworkspacetomonitor, 5 current"
        "${mainMod}, 5, workspace, 5"
        "${mainMod}, 6, moveworkspacetomonitor, 6 current"
        "${mainMod}, 6, workspace, 6"
        "${mainMod}, 7, moveworkspacetomonitor, 7 current"
        "${mainMod}, 7, workspace, 7"
        "${mainMod}, 8, moveworkspacetomonitor, 8 current"
        "${mainMod}, 8, workspace, 8"
        "${mainMod}, 9, moveworkspacetomonitor, 9 current"
        "${mainMod}, 9, workspace, 9"
        "${mainMod}, 10, moveworkspacetomonitor, 10 current"
        "${mainMod}, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "${mainMod} SHIFT, 1, movetoworkspace, 1"
        "${mainMod} SHIFT, 2, movetoworkspace, 2"
        "${mainMod} SHIFT, 3, movetoworkspace, 3"
        "${mainMod} SHIFT, 4, movetoworkspace, 4"
        "${mainMod} SHIFT, 5, movetoworkspace, 5"
        "${mainMod} SHIFT, 6, movetoworkspace, 6"
        "${mainMod} SHIFT, 7, movetoworkspace, 7"
        "${mainMod} SHIFT, 8, movetoworkspace, 8"
        "${mainMod} SHIFT, 9, movetoworkspace, 9"
        "${mainMod} SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "${mainMod}, mouse_down, workspace, e+1"
        "${mainMod}, mouse_up, workspace, e-1"

        ",XF86MonBrightnessUp,exec,brightnessctl +5%"
        ",XF86MonBrightnessDown,exec,brightnessctl 5%-"

        "bind = ALT,tab,hycov:toggleoverview"
        "bind=ALT,left,hycov:movefocus,l"
        "bind=ALT,right,hycov:movefocus,r"
        "bind=ALT,up,hycov:movefocus,u"
        "bind=ALT,down,hycov:movefocus,d"
    ];

    wayland.windowManager.hyprland.settings.bindm = [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
    ];

}
