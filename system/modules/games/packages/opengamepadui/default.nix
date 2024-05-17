{stdenv, pkgs, fetchurl}: let 
    escape = content: "$\{" + content + "}";
in stdenv.mkDerivation (finalAttrs: {
    pname = "OpenGamepadUI";
    version = "0.30.5";

    src = fetchurl {
        url = "https://github.com/ShadowBlip/OpenGamepadUI/releases/download/v${finalAttrs.version}/opengamepadui.tar.gz";
        hash = "sha256-8E8HYjci2H6NdqmtLhMrhgHMZRE4grPnTBU5YsNF3VE=";
    };

    wrapper = ./wrapper.sh;

    buildInputs = with pkgs; [
        gamescope
        libgcc
        glibc
        libevdev
        xorg.libX11
        xorg.libXau
        xorg.libxcb
        xorg.libXdmcp
        xorg.libXext
        xorg.libXres
    ];

    dontBuild = true;

    installPhase = ''
        tar xvfz $src
        make install PREFIX=$out
        rm $out/bin/opengamepadui
        cp $wrapper $out/bin/opengamepadui
        substituteInPlace $out/bin/opengamepadui \
            --replace "<<storedir>>" $out
        chmod +x $out/bin/opengamepadui
    '';
})
