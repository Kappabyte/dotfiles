{pkgs, lib, config}: {
    nixpkgs.overlays = [(final: prev: {
        ryujinx = prev.ryujinx.overrideAttrs(oldAttrs: rec {
            src = prev.fetchFromGitHub {
                owner = "Ryujinx";
                repo = "Ryujinx";
                rev = "d704bcd93b90c288e6e200378373403525b59220";
                sha256 = "0vf964rgr5jry8aszzbjm3jh7qd0d8b6rpzibb7b564awzy6kzda";
            };
        });
    })];
}
