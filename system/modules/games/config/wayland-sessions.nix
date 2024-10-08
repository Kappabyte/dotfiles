{ pkgs, ... }: {
    properties.wayland-sessions.session-list = [(pkgs.callPackage ../packages/steam-gamescope {})];
}
