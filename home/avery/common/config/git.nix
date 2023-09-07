{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.git = {
        enable = true;
        userName = "Avery Keuben";
        userEmail = "avery1516@gmail.com";
        extraConfig = {
            diff.tool = "vimdiff";
            push.autoSetupRemote = "true";
            init.defaultBranch = "main";
            commit.gpgsign = "true";
        };
    };
}
