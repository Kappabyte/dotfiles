{pkgs, lib}: {
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
        #cemu
        steam
        mangohud
        ryujinx
        (pkgs.callPackage ./packages/suyu {}) 
        gamescope
        steamtinkerlaunch
        prismlauncher
    ];
}
