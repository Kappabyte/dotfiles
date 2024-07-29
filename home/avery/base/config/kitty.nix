{ config, ... }: {
    programs.kitty = {
        enable = true;
        font.name = "JetBrainsMono Nerd Font";
        shellIntegration.enableFishIntegration = true;
        shellIntegration.enableBashIntegration = true;
        settings = {
            background_opacity = "0.9";
            include = "colors.conf";
        };

    };

    xdg.configFile."kitty/colors.conf".text = ''
        cursor ${config.colors.on_surface}
        cursor_text_color ${config.colors.on_surface_variant}

        foreground            ${config.colors.on_surface}
        background            ${config.colors.surface}
        selection_foreground  ${config.colors.on_secondary}
        selection_background  ${config.colors.secondary_fixed_dim}
        url_color             ${config.colors.primary}

        # black
        color8   #262626
        color0   #4c4c4c

        # red
        color1   #ac8a8c
        color9   #c49ea0

        # green
        color2   #8aac8b
        color10  #9ec49f

        # yellow
        color3   #aca98a
        color11  #c4c19e

        # blue
        /* color4  #8f8aac */
        color4  ${config.colors.primary}
        color12 #a39ec4

        # magenta
        color5   #ac8aac
        color13  #c49ec4

        # cyan
        color6   #8aacab
        color14  #9ec3c4

        # white
        color15   #e7e7e7
        color7  #f0f0f0
    '';
}
