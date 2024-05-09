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
            alias = {
                authors = "!git --no-pager log | grep Author | cut -f 2- -d ' ' | awk '{ sub(\" [^ ]*$\", \"\"); print }' | sort | uniq -c";
            };
        };
    };
}
