{config, pkgs, lib, ...}: {
    nixpkgs.overlays = [(final: prev: {
        libsForQt5.kdeconnect-kde = prev.libsForQt5.kdeconnect-kde.overrideAttrs(oldAttrs: rec {
            cmakeFlags = [
                "-DBLUETOOTH_ENABLED:BOOL=ON"
            ];
        });
    })];
}
