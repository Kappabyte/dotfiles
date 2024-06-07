{pkgs, inputs, ...}: 
let 
    muse-sounds-manager = inputs.muse-sounds-manager; 
in {
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
        
        libreoffice-fresh       
        calibre
        pinta
        tagger
        gimp
        inkscape

        ulauncher

        hyprpaper
        hyprlock
        hypridle
        hyprpicker

        papirus-folders
        catppuccin-cursors.mochaLight
        adw-gtk3

        bluetuith
        antimicrox

        swappy
        slurp
        grim

        gnome.gnome-keyring
        xdg-utils
        musescore
        muse-sounds-manager.packages.x86_64-linux.muse-sounds-manager

        alsa-oss
        faudio
        gnome.zenity
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
