{ ... }: {
    programs.nh = {
        enable = true;
        flake = "/home/avery/code/projects/current/dotfiles";
        clean = {
            enable = true;
            dates = "weekly";
            extraArgs = "--keep 3";
        };
    };
}
