{pkgs, inputs, ...}: 
let 
    muse-sounds-manager = inputs.muse-sounds-manager; 
in {
    environment.systemPackages = (with pkgs; [
        firefox
        thunderbird
        nemo-with-extensions
        webcord-vencord
        kitty
        
        mpv
        (quodlibet-full.override {
            python3 = python311;
        })
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

        gnome-keyring
        xdg-utils
        musescore

        alsa-oss
        faudio
        zenity
    ]) ++ [
        muse-sounds-manager.packages.x86_64-linux.muse-sounds-manager
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
