{ fetchurl, appimageTools, ... }: let
    appimage-file = fetchurl {
        url = "https://archive.org/download/yuzu-windows-msvc-20240304-537296095_20240305_1340/Linux/Linux-Yuzu-EA-4176.AppImage";
        sha256 = "sha256-F2MTlm0OgcE/mzEwS7AJ4UkoLlHyf3tTnS9FRRLT5Qk=";
    };
in appimageTools.wrapType2 {
    name = "yuzu";
    version = "EA-4176";
    src = appimage-file;
}
