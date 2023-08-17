{config, pkgs, lib, ...}: {
    nixpkgs.overlays = [(final: prev: {
        sddm-chili-theme = prev.sddm-chili-theme.overrideAttrs(oldAttrs: rec {
            bkg = ./data/wallpaper.jpg;
            postInstall = ''
            mkdir -p $out/share/sddm/themes/chili

            mv * $out/share/sddm/themes/chili/
            cp $bkg $out/share/sddm/themes/chili/assets/background.jpg
            '';
        });
    })];
}
