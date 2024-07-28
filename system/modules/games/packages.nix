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
        mangohud
        (callPackage ./packages/yuzu {}) 
        (callPackage ./packages/ryujinx {}) 
        steamtinkerlaunch
        (prismlauncher.override {additionalLibs = [ 
            xorg.libXtst 
            xorg.libXi
        ]; })
        pegasus-frontend
    ];
}
