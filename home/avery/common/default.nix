{ lib, inputs, pkgs, user, home-manager, ... }: {
    imports = [
        # Configuration Files
        ./config/fish.nix
        ./config/easyeffects.nix
        ./config/eww
        ./config/gtk.nix
        ./config/git.nix
        ./config/direnv.nix
        ./config/xdg.nix
        ./config/kitty.nix
        ./config/nvim
        ./config/dunst.nix
        ./config/tmux.nix
        ./config/hyprpaper
    ];

    home = {
        stateVersion = "22.05";
    };
}
