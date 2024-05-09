{pkgs, lib, config}: {
    services.udev.extraRules = ''
        SUBSYSTEM=="usb", MODE="0660", GROUP="plugdev"
    '';
    users.groups = {
        plugdev = {};
    };
}
