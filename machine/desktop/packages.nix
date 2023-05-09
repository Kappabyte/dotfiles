{ config, pkgs, ... }: {
    
    # System packages common to all machines
    environment.systemPackages = with pkgs; [
        steam
        cemu

        libsForQt5.kdenlive
        prismlauncher
        glxinfo
        pciutils
    ];
}
