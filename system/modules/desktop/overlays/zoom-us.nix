{ ... }: {
    nixpkgs.overlays = [(final: prev: {
        zoom-us = prev.zoom-us.overrideAttrs(attrs: {
            src = prev.fetchurl {
                url = "https://zoom.us/client/6.0.12.5501/zoom_x86_64.pkg.tar.xz";
                hash = "sha256-h9gjVd7xqChaoC2BZWEhR5WdyfQrPiBjM2WHXMgp8uQ=";
            };
        });
    })];
}
