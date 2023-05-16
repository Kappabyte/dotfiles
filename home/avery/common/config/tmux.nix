{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.tmux = {
        enable = true;
        mouse = true;
        prefix = "C-a";
        plugins = with pkgs; [
            tmuxPlugins.catppuccin
            tmuxPlugins.sessionist
            tmuxPlugins.resurrect
            {
                plugin = tmuxPlugins.continuum;
                extraConfig = ''
                set -g @continuum-restore 'on'
                set -g @continuum-save-interval '10'
                '';
            }
            tmuxPlugins.sidebar
        ];
    };
}
