{ fetchurl, appimageTools, ... }: let
    appimage-file = fetchurl {
        src = "https://git.suyu.dev/suyu/suyu/releases/download/v0.0.1/Suyu-Linux_x86_64.AppImage";
        sha256 = "";
    };
in appimageTools.wrapType2 {
    name = "suyu";
    version = "0.0.1";
    src = appimage-file;
}
