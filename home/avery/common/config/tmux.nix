{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.tmux = {
        enable = true;
        mouse = true;
        prefix = "C-a";
        plugins = with pkgs; [
            tmuxPlugins.catppuccin
            tmuxPlugins.sessionist
            tmuxPlugins.resurrect
            tmuxPlugins.continuum
        ];
    };
}
