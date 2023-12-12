{ lib, inputs, pkgs, user, home-manager, ... }: {
    imports = [
        # Configuration Files
        ./config/fish.nix
        ./config/easyeffects.nix
        ./config/eww
        ./config/ags
        ./config/gtk.nix
        ./config/ssh.nix
        ./config/obs.nix
        ./config/git.nix
        ./config/direnv.nix
        ./config/xdg.nix
        ./config/kitty.nix
        ./config/nvim.nix
        ./config/dunst.nix
        ./config/tmux.nix
        ./config/hyprpaper
    ];

    home = {
        stateVersion = "22.05";
    };
}
