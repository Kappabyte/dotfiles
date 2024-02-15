{lib, pkgs, config}: {
    programs.gnupg.agent = {
        enable = true;
        pinentryFlavor = "curses";
    };
}
