{ pkgs, ... }: {
    stylix = {
        enable = true;    
        stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
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
    };
}

