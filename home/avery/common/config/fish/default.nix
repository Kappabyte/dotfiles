{ lib, inputs, pkgs, user, home-manager, ... }: {
    imports = [
        ./aliases.nix
        ./functions/nix.nix
        ./functions/ssh.nix
        ./functions/fish.nix
    ];
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            fish_ssh_agent
            
            if not test -z $(tty | grep pts); and not set -q TMUX;
                exec tmux new -A -s avery
            end
        '';

        shellInit = ''
        set -x DIRENV_LOG_FORMAT ""
        direnv hook fish | source
        thefuck -a fuck | source
        '';
        plugins = [
            { name = "grc"; src = pkgs.fishPlugins.grc.src; }
        ];
    };
}
