{ fetchurl, appimageTools, ... }: let
    appimage-file = fetchurl {
        url = "https://git.suyu.dev/suyu/suyu/releases/download/v0.0.1/Suyu-Linux_x86_64.AppImage";
        sha256 = "sha256-F2MTlm0OgcE/mzEwS7AJ4UkoLlHyf3tTnS9FRRLT5Qk=";
    };
in appimageTools.wrapType2 {
    name = "suyu";
    version = "0.0.1";
    src = appimage-file;
}
