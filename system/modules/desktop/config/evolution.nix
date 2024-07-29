{pkgs, ...}: {
    services.gnome.evolution-data-server.enable = true;
    programs.evolution = {
        enable = true;
        plugins = with pkgs; [ evolution-ews ];
    };
}
