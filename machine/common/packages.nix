{ config, pkgs, ... }: {
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    
    # System packages common to all machines
    environment.systemPackages = with pkgs; [
        # Base apps
        firefox
        thunderbird
        cinnamon.nemo-with-extensions
        webcord-vencord
        kitty
        
        # Media
        vlc
        amberol
        gthumb
        pavucontrol

        # Development
        vscode
        cmake
        neofetch
        onefetch
        neovim
        tmux
        tmux-sessionizer
        wget
        git
        gh

        # Office/School
        libreoffice-fresh       

        # User Interface
        sddm-kcm
        wofi
        hyprpaper
        swaylock
        papirus-folders
        catppuccin-cursors.mochaLight
       
        # Settings
        bluetuith
        
        # Background services
        xdg-user-dirs
        gnome.gnome-keyring
        grc
        dunst
        libimobiledevice
        ifuse
        socat
        playerctl
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
