{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        (callPackage ./packages/iio-hyprland {}) 
        maliit-keyboard
    ];
}
