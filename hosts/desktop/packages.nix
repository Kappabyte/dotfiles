{ config, pkgs, ... }: {
    
    # System packages common to all machines
    environment.systemPackages = with pkgs; [
        steam
        (lutris.override {
            extraLibraries = pkgs: [
                wineWowPackages.waylandFull
            ];
            extraPkgs = pkgs: [
                wineWowPackages.waylandFull
                dxvk
                vkd3d-proton
            ];
        })
        cemu
        yuzu
        gamescope
        steamtinkerlaunch

        libsForQt5.kdenlive
        openshot-qt
        libsForQt5.libopenshot-audio
        libsForQt5.libopenshot
        prismlauncher
        glxinfo
        pciutils
    ];
}
