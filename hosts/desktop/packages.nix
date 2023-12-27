{ config, pkgs, ... }: {
    
    # System packages common to all machines
    environment.systemPackages = with pkgs; [
        steam
        lutris
        cemu
        yuzu
        gamescope
        steamtinkerlaunch
        (pkgs.callPackage ../../packages/totk-mod-manager/default.nix {})

        libsForQt5.kdenlive
        openshot-qt
        libsForQt5.libopenshot-audio
        libsForQt5.libopenshot
        prismlauncher
        glxinfo
        pciutils
    ];
}
