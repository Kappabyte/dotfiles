{ pkgs, lib, config}: {
    users.users.avery = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "adbusers" "plugdev" "dialout" ];
    };
}
