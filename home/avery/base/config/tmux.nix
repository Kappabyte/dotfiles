{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.tmux = {
        enable = true;
        mouse = true;
        prefix = "C-a";
        extraConfig = ''
            bind C-j display-popup -E "tms switch"
            bind C-o display-popup -E "tms"
            set-option -g status-position top
        '';
    };
}
