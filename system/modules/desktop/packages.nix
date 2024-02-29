{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        firefox
        thunderbird
        cinnamon.nemo-with-extensions
        webcord-vencord
        kitty
        
        vlc
        obs-studio
        zoom-us
        amberol
        gthumb
        pavucontrol
        openrgb
        
        libreoffice-fresh       
        calibre
        pinta
        tagger
        gimp
        inkscape

        ulauncher
        hyprpaper
        swaylock-effects

        papirus-folders
        catppuccin-cursors.mochaLight
        adw-gtk3

        bluetuith

        swappy
        slurp
        grim

        gnome.gnome-keyring
        xdg-utils
    ];

    fonts.packages = with pkgs; [
        helvetica-neue-lt-std
        noto-fonts
        noto-fonts-emoji
        font-awesome
        font-awesome_5
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
}
