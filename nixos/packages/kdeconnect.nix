{ config, pkgs, lib, ... }: {
    imports = [
        ../overlays/kdeconnect.nix
    ];
    programs.kdeconnect.enable = true;
    programs.kdeconnect.package = pkgs.plasma5Packages.kdeconnect-kde;
}
