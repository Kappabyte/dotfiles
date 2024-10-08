{ pkgs, ... }: {
    stylix = {
        enable = true;    
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
        image = ../../../../home/avery/base/config/hyprpaper/wallpaper.png;
        polarity = "dark";
        cursor = {
            package = pkgs.vanilla-dmz;
            name = "Vanilla-DMZ";
            size = 32;
        };
        fonts = {
            emoji = {
                package = pkgs.twemoji-color-font;
                name = "TwitterColorEmoji-SVGinOT";
            };
            monospace = {
                package = with pkgs; (nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
                name = "JetBrainsMono Nerd Font";
            };
            sansSerif = {
                package = pkgs.noto-fonts;
                name = "Noto Sans";
            };
            serif = {
                package = pkgs.noto-fonts;
                name = "Noto Serif";
            };
        };
        targets.fish.enable = false;
    };
}

