{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.ssh.enable = true;
    programs.ssh.matchBlocks = {
        "github.com" = {
            user="git";
            hostname="github.com";
            identityFile="~/.ssh/github";
        };
        "ucalgary" = {
            user="avery.keuben";
            hostname="cslinux.ucalgary.ca";
            port=22;
            identityFile="~/.ssh/ucalgary";
        };
        "ucalgaryarm" = {
            user="avery.keuben";
            hostname="csarm.ucalgary.ca";
            port=22;
            identityFile="~/.ssh/ucalgary";
        };
    };
}
