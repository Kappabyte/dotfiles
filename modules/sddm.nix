{ config, pkgs, ... }: {
    imports = [
        ../overlays/sddm-chili/sddm-chili.nix
    ];
    services.xserver.enable = true;
    hardware.opengl.enable = true;

    services.xserver.displayManager.sddm.enable = true;
    services.xserver.displayManager.sddm.enableHidpi = true;
    services.xserver.displayManager.sddm.theme = "chili";

    environment.systemPackages = [
        pkgs.libsForQt5.qt5.qtquickcontrols2
        pkgs.libsForQt5.qt5.qtsvg
        pkgs.libsForQt5.qt5.qtgraphicaleffects
        pkgs.sddm-chili-theme
    ];
}
