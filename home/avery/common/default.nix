{ lib, inputs, pkgs, user, home-manager, ... }: {
    imports = [
        # Configuration Files
        ./config/fish.nix
        ./config/gtk.nix
        ./config/xdg.nix
        ./config/kitty.nix
        ./config/nvim
    ];

    home = {
        stateVersion = "22.05";
    };
}