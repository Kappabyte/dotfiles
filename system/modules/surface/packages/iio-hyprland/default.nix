{ stdenv, 
  lib, 
  fetchFromGitHub, 
  meson,
  ninja,
  gcc,
  cmake,
  pkg-config,
  dbus
}: stdenv.mkDerivation {
    pname = "iio-hyprland";
    version = "626dc91";
    
    src = fetchFromGitHub {
        owner = "JeanSchoeller";
        repo = "iio-hyprland";
        rev = "626dc91";
        sha256 = "sha256-ad0AtYHBDskrimmj6kI15dMVVG8aWnaJVckRcOM94IQ=";
    };

    nativeBuildInputs = [
        meson
        gcc
        cmake
        pkg-config
        dbus
        ninja
    ];

    meta = with lib; {
        description = "IIO service for auto screen rotation on Hyprland.";
    };
}
