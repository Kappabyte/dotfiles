{ config, pkgs, ... }: {
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    
    # System packages common to all machines
    environment.systemPackages = with pkgs; [
        firefox
        thunderbird
        cinnamon.nemo-with-extensions
        discord
        
        vlc
        amberol
        gthumb
        pavucontrol

        vscode
        jetbrains.clion
        jetbrains.idea-ultimate
        cmake
        neofetch
        onefetch
        neovim
        tmux
        tmux-sessionizer
        wget
        git
        gh
        grc

        kitty
        wofi
        eww
        hyprpaper

        (pkgs.callPackage ../../custom/packages/khinsider/default.nix {}) 
        sddm-kcm
        
        xdg-user-dirs
        gnome.gnome-keyring
        papirus-folders
        catppuccin-cursors.mochaLight
        
        bluetuith
        dunst
        libimobiledevice
        ifuse
    ];

    # Force electron applications to use wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    fonts.fonts = with pkgs; [
        noto-fonts
        noto-fonts-emoji
        font-awesome
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
}
