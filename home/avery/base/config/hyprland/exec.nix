{ ... }: {
    wayland.windowManager.hyprland.settings.exec-once = [
        "hyprpaper"
        "/home/avery/.config/eww/launch.sh"
        "keepassxc"
        "ulauncher --no-window-shadow --hide-window"

        "hyprctl dispatch workspace 1"
    ];
}
