{pkgs, lib}: {
    nixpkgs.overlays = [(final: prev: {
        swaylock-effects = prev.swaylock-effects.overrideAttrs(oldAttrs: rec {
            src = prev.fetchFromGitHub {
                owner = "jirutka";
                repo = "swaylock-effects";
                rev = "7c5681c";
                sha256 = "sha256-09Kq90wIIF9lPjiY2anf9MSgi/EqeXKXW1mFmhxA/aM";
            };
        });
    })];
}
