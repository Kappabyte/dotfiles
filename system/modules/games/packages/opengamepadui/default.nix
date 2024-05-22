{ lib
, fetchFromGitHub
, stdenv
, unzip
, alsa-lib
, gcc-unwrapped
, git
, godot_4
, godot_4-export-templates
, scons
, python311
, libGLU
, libX11
, libXcursor
, libXext
, libXfixes
, libXi
, libXinerama
, libXrandr
, libXrender
, libglvnd
, libXres
, libXtst
, mesa
, libpulseaudio
, libevdev
, zlib
, autoPatchelfHook
, vulkan-loader
, libGL
, 
}:

stdenv.mkDerivation {
  pname = "opengamepadui";
  version = "0.30.5";

  src = fetchFromGitHub {
    owner = "ShadowBlip";
    repo = "OpenGamepadUI";
    rev = "fc343abe1caaab5bbf661d39a8256ba6bf95db7b";
    hash = "sha256-nzT5t3e3IW9jtmQlWcWt40hudYgNesPEDU6sJGuDkx4=";
  };

  nativeBuildInputs = [
    godot_4
    unzip
  ];

  buildInputs = [
    alsa-lib
    python311
    scons
    gcc-unwrapped.lib
    git
    libGLU
    libX11
    libXcursor
    libXext
    libXfixes
    libXi
    libXres
    libXtst
    libXinerama
    libXrandr
    libXrender
    libglvnd
    libpulseaudio
    libevdev
    zlib
    mesa
  ];
  runtimeDependencies = [
    libGL
    vulkan-loader
    libX11
    libXcursor
    libXext
    libXi
    libXrandr
  ];

  buildPhase = ''
    runHook preBuild

    # Cannot create file '/homeless-shelter/.config/godot/projects/...'
    export HOME=$TMPDIR

    # Link the export-templates to the expected location. The --export commands
    # expects the template-file at .../templates/3.2.3.stable/linux_x11_64_release
    # with 3.2.3 being the version of godot.
    mkdir -p $HOME/.local/share/godot
    mkdir -p $HOME/.local/share/godot/export_templates
    cp -r ${godot_4-export-templates} $HOME/.local/share/godot/export_templates/4.2.2.stable 
    ls $HOME/.local/share/godot/export_templates/4.2.2.stable 

    ln -s ${godot_4-export-templates} $HOME/.local/share/godot/export_templates/

    mkdir -p $out/bin
    timeout --foreground 60 godot4 --headless --editor . || echo "Done Importing!"
    godot4 --headless --export-release "Linux/X11" $out/bin/opengamepadui

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/gapophustu/4D-Minesweeper";
    description = "A 4D Minesweeper game written in Godot";
    license = licenses.mpl20;
    platforms   = platforms.linux;
    maintainers = with maintainers; [ nayala ];
    mainProgram = "4d-minesweeper";
  };
}
