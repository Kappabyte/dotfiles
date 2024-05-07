{ config, pkgs, lib, hostName, ... }: {
    imports = [
        ../../modules
    ] ++ lib.optional (builtins.pathExists ./packages.nix) ./packages.nix
      ++ lib.optional (builtins.pathExists ./hardware) ./hardware;

    module.base.enable = true;
    module.desktop.enable = true;
    module.development.enable = true;
    module.games.enable = true;
    module.tools.enable = true;

    fake = true;

    ## Set the hostname
    networking.hostName = hostName;
}
