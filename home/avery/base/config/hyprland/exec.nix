{ ... }: {
    wayland.windowManager.hyprland.settings.exec-once = [
        "hyprpaper"
        "ags"
        "keepassxc"
        "antimicrox"
        "ulauncher --no-window-shadow --hide-window"

        "hyprctl dispatch workspace 1"
    ];
}
