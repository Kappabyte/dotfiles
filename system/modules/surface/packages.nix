{pkgs, lib}: {
    environment.systemPackages = with pkgs; [
        (pkgs.callPackage ./packages/iio-hyprland {}) 
    ];
}
