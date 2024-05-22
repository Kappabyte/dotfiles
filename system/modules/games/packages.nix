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
        (callPackage ./packages/yuzu {}) 
        (callPackage ./packages/ryujinx {}) 
        gamescope
        steamtinkerlaunch
        prismlauncher
        pegasus-frontend
    ];
}
