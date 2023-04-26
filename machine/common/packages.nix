{ config, pkgs, ... }: {
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    
    # System packages common to all machines
    environment.systemPackages = with pkgs; [
        firefox
        thunderbird
        cinnamon.nemo

        vscode
        jetbrains.clion
        jetbrains.idea-ultimate
        cmake
        neofetch
        neovim
        wget
        git
        grc

        kitty

        wofi
        waybar
        hyprpaper

        sddm-kcm
        
        xdg-user-dirs
        gnome.gnome-keyring
        papirus-folders
        catppuccin-cursors.mochaLight
    ];

    fonts.fonts = with pkgs; [
        noto-fonts
        noto-fonts-emoji
        font-awesome
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
}
