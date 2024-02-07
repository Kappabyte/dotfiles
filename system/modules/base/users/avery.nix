{ pkgs, lib}: {
    users.users.avery = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "adbusers" ];
    };
}
