{config, pkgs, lib, ...}: {
    nixpkgs.overlays = [(final: prev: {
        iptsd = prev.iptsd.overrideAttrs(oldAttrs: rec {
            mesonFlags = [
                "-Dservice_manager=systemd"
                "-Dsample_config=false"
                "-Ddebug_tools=calibrate,dump"
                "-Db_lto=false"  # plugin needed to handle lto object -> undefined reference to ...
            ];
        });
    })];
}
