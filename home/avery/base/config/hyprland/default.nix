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
            inputs.hycov.packages.${pkgs.system}.hycov
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
            plugin = {
                hycov = {
                    overview_gappo = 20; #gaps width from screen
                    overview_gappi = 20; #gaps width from clients
                    enable_hotarea = 0; # enable mouse cursor hotarea
                    enable_alt_release_exit = 1;
                    alt_toggle_auto_next = 1;
                    auto_exit = 1;
                    enable_gesture = 1;
                    swipe_fingers = 3;
                };
            };
        };
    };
}
