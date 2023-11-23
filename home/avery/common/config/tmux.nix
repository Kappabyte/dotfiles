{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.tmux = {
        enable = true;
        mouse = true;
        prefix = "C-a";
        plugins = [
            (pkgs.tmuxPlugins.onedark-theme.overrideAttrs(_:{
                src = pkgs.fetchFromGitHub {
                    owner = "Kappabyte";
                    repo = "tmux-onedark-theme";
                    rev = "d8f63084a4cac3a7b2fefdd17aa73e08491d254b";
                    sha256 = "sha256-TY3tivN7qCSFDOLGv+mbjYmjoX8ZjEmOpuTdTyShkP4=";
                };
            }))
        ];
        extraConfig = ''
            bind C-j display-popup -E "tms switch"
            bind C-o display-popup -E "tms"
            set-option -g status-position top
        '';
    };
}
