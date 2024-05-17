{stdenv, pkgs, lib, fetchFromGitHub}: stdenv.mkDerivation (finalAttrs: {
    pname = "steam-gamescope-desktop";
    version = "0.30.5";

    src = fetchFromGitHub {
        owner = "ShadowBlip";
        repo = "OpenGamepadUI";
        rev = "ref/tags/v${finalAttrs.version}";
        hash = "";
    };

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

    nativeBuildInputs = with pkgs; [
        godot_4
        gcc
        python311Full
        scons
        pkg-config
        xorg.libX11
        xorg.libXcursor
        xorg.libXinerama
        xorg.libXi
        xorg.libXrandr
        mesa
        alsa-lib
        pulseaudio
        libevdev    
        gnumake
        unzip
        wget
    ];

    installPhase = ''
        mkdir $out
        mkdir $out/share
        mkdir $out/bin
        mkdir $out/share/wayland-sessions
        cp $src/steam-gamescope.desktop $out/share/wayland-sessions/
        cp $src/steamos-session-select $out/bin
        chmod +x $out/bin/steamos-session-select
    '';
})
