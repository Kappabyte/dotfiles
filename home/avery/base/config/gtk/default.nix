{ pkgs, ... }: {
    gtk = {
        enable = true;
        iconTheme = {
            name = "Gruvbox-Plus-Dark";
            package = pkgs.gruvbox-plus-icons;
        };
    };
}
