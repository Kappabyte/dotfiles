{lib, pkgs, config}: {
    boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

    boot.initrd.systemd.enable = true;
    boot.kernelParams = ["quiet"];
}
