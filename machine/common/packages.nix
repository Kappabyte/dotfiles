{ config, pkgs, ... }: {
    imports = [
        ../../nixos/overlays/swaylock-effects.nix
    ];
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    
    # System packages common to all machines
    environment.systemPackages = with pkgs; [
        # Base apps
        firefox
        chromium
        thunderbird
        cinnamon.nemo-with-extensions
        webcord-vencord
        kitty
        
        # Media
        vlc
        amberol
        gthumb
        pavucontrol
        openrgb

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

        # Productivity
        libreoffice-fresh       
        calibre
        pinta
        tagger
        gimp
        inkscape

        # User Interface
        sddm-kcm
        wofi
        hyprpaper
        swaylock-effects
        papirus-folders
        catppuccin-cursors.mochaLight
       
        # Settings
        bluetuith

        # Utilities
        xdg-ninja
        swappy
        slurp
        grim
        playerctl
        (pkgs.callPackage ../../custom/packages/khinsider/default.nix {}) 
        btop
        libnotify
        unzip
        acpi
        evtest

        # Services
        xdg-user-dirs
        gnome.gnome-keyring
        grc
        dunst
        libimobiledevice
        ifuse
        socat
    ];

    # Force electron applications to use wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    fonts.packages = with pkgs; [
        helvetica-neue-lt-std
        noto-fonts
        noto-fonts-emoji
        font-awesome
        font-awesome_5
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
}
