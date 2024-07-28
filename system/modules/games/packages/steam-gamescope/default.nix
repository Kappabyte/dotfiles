{stdenv}: stdenv.mkDerivation {
    pname = "steam-gamescope-desktop";
    version = "0.0.1";

    src = ./src;

    installPhase = ''
        mkdir $out
        mkdir $out/share
        mkdir $out/bin
        mkdir $out/share/wayland-sessions
        cp $src/steam-gamescope.desktop $out/share/wayland-sessions/
        cp $src/steamos-session-select $out/bin
        chmod +x $out/bin/steamos-session-select
    '';
}
