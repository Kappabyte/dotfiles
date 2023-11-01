{config, pkgs, lib, ...}: {
    nixpkgs.overlays = [(final: prev: {
        libsForQt5 = prev.libsForQt5.overrideScope(final: prev: {
            kdeconnect-kde = prev.kdeconnect-kde.overrideAttrs(oldAttrs: rec {
                buildInputs = (oldAttrs.buildInputs or []) ++ [ pkgs.libsForQt5.qtconnectivity ];
                cmakeFlags = [
                    "-DBLUETOOTH_ENABLED:BOOL=ON"
                ];
            });   
        });
    })];
}
