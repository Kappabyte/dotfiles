{pkgs, ...}: {
    environment.systemPackages = with pkgs;[
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
        _2ship2harkinian
        shipwright
        dolphin-emu
        retroarchFull
        steam-rom-manager

        mangohud
        (callPackage ./packages/yuzu {}) 
        (callPackage ./packages/sudachi {}) 
        ryujinx
        steamtinkerlaunch
        (prismlauncher.override {additionalLibs = [ 
            xorg.libXtst 
            xorg.libXi
        ]; })
        pegasus-frontend
    ];
}
