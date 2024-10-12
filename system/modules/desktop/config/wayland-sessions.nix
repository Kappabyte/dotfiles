{ pkgs, ... }: {
    properties.wayland-sessions.session-list = with pkgs; [ hyprland niri ];
}
