{ ... }: {
    wayland.windowManager.hyprland.settings = {
        monitor = [
            "DP-1, 2560x1440@165, 2560x0, 1"
            "DP-2, 2560x1440@165, 0x0, 1"
        ];
        workspace = [
            "DP-1, 2"
            "DP-2, 1"
        ];
    };
}
