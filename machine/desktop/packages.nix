{ config, pkgs, ... }: {
    
    # System packages common to all machines
    environment.systemPackages = with pkgs; [
        steam
        cartridges
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
