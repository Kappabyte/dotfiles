{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.tmux = {
        enable = true;
        mouse = true;
        plugins = with pkgs; [
            tmuxPlugins.catppuccin
            tmuxPlugins.sessionist
        ];
    };
}
