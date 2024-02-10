{pkgs, lib}: {
    nixpkgs.overlays = [(final: prev: {
        iptsd = prev.iptsd.overrideAttrs(oldAttrs: rec {
            pname = "iptsd";

            src = prev.fetchFromGitHub {
                owner = "Kappabyte";
                repo = pname;
                rev = "9efcf24";
                hash = "sha256-cQNhV77IhI83TbTGkEYdDCteZFlvyb3vqCe2+xl9P9E=";
            };

            mesonFlags = [
                "-Dservice_manager=systemd"
                "-Dsample_config=false"
                "-Ddebug_tools=calibrate,dump"
                "-Db_lto=false"  # plugin needed to handle lto object -> undefined reference to ...
            ];
        });
    })];
}
