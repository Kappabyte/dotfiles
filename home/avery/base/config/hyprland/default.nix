{ pkgs, inputs, ... }: {
    imports = [
        ./binds.nix
        ./decoration.nix
        ./exec.nix
    ];

    xdg.configFile."hypr/lock.sh".source = ./lock.sh;
    xdg.configFile."hypr/rotate.sh".source = ./rotate.sh;

    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        plugins = [
        ];
        settings = {
            input = {
                kb_layout = "us";
                follow_mouse = 2;
                float_switch_override_focus = false;
                natural_scroll = false;
                touchpad = {
                    natural_scroll = true;
                    scroll_factor = 0.3;
                };
            };
            master = {
                new_is_master = true;
            };
            gestures = {
                workspace_swipe = true;
            };
        };
    };
}
