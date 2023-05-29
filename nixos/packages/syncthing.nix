{ config, pkgs, ...}: {
    services.syncthing = {
        enable = true;
        dataDir = "/home/avery";
        configDir = "/home/avery/.config/syncthing";
    };
}
