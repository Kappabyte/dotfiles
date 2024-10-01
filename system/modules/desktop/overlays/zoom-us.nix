{ pkgs, ... }: {
    nixpkgs.overlays = [(final: prev: {
        zoom-us = prev.zoom-us.overrideAttrs(attrs: {
            nativeBuildInputs = (attrs.nativeBuildInputs or []) ++ [ pkgs.bbe ];
            postFixup = ''
                cp $out/opt/zoom/zoom .
                bbe -e 's/0manjaro\0/\0nixos\0\0\0/' < zoom > $out/opt/zoom/zoo
            '' + (attrs.postFixup or "") + ''
                sed -i 's\Exec=\Exec=env XDG_CURRENT_DESKTOP="gnone" |' $out/share/applications/Zoom.desktop
            '';
        });
    })];
}
