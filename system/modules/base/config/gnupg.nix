{lib, pkgs, config}: {
    programs.gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-curses;
    };
}
