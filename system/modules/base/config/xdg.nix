{ pkgs, ... }: {
    xdg.portal = {
        enable = true;
        extraPortals = [pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-gnome pkgs.xdg-desktop-portal-wlr];
        config = {
            common.default = ["gtk"];
            hyprland.default = [
                "wlr" 
                "gtk"
            ];
            niri.default = [
                "gnome"
                "gtk"
            ];
        };
    };
}
