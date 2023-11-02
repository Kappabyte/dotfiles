{config, pkgs, lib, ...}: let
    inherit (pkgs) fetchurl;
in {
    nixpkgs.overlays = [(final: prev: {
        obsidian = prev.obsidian.overrideAttrs(oldAttrs: rec {
            version = "1.4.14";
            filename = "obsidian-${version}.tar.gz";
            src = fetchurl {
                url = "https://github.com/obsidianmd/obsidian-releases/releases/download/v${version}/${filename}";
                hash = "sha256-qFSQer37Nkh3A3oVAFP/0qXzPWJ7SqY2GYA6b1iaYmE=";
            };
        });

    })];
}
