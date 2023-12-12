{pkgs, ...}: {
    programs.ags = {
        enable = true;
        extraPackages = [pkgs.libdbusmenu-gtk3];
    };
}
