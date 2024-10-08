{ ... }: {
    wayland.windowManager.hyprland.settings.exec-once = [
        "hyprpaper"
        "ags"
        "keepassxc"
        "antimicrox --hidden"
        "ulauncher --no-window-shadow --hide-window"
        "vesktop --start-minimized"
        "streamcontroller -b"


        "hyprctl dispatch workspace 1"
    ];
}
