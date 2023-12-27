{ pkgs, lib, appimageTools, fetchurl, ...}: 
appimageTools.wrapType2 { # or wrapType1
    name = "patchwork";
    src = fetchurl {
        url = "https://github.com/ssbc/patchwork/releases/download/v3.11.4/Patchwork-3.11.4-linux-x86_64.AppImage";
        hash = "sha256-OqTitCeZ6xmWbqYTXp8sDrmVgTNjPZNW0hzUPW++mq4=";
    };
    extraPkgs = pkgs: with pkgs; [ ];
}

