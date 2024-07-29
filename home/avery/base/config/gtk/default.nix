{ config, pkgs, ... }: {
    gtk = {
        enable = true;
        theme = {
            name = "adw-gtk3-dark";
            package = pkgs.adw-gtk3;
        };
        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme;
        };
    };

    xdg.configFile."gtk-4.0/gtk.css".text = ''
        @define-color accent_color ${config.colors.primary_fixed_dim};
        @define-color accent_fg_color ${config.colors.on_primary_fixed};
        @define-color accent_bg_color ${config.colors.primary_fixed_dim};
        @define-color window_bg_color ${config.colors.surface_dim};
        @define-color window_fg_color ${config.colors.on_surface};
        @define-color headerbar_bg_color ${config.colors.surface_dim};
        @define-color headerbar_fg_color ${config.colors.on_surface};
        @define-color popover_bg_color ${config.colors.surface_dim};
        @define-color popover_fg_color ${config.colors.on_surface};
        @define-color view_bg_color ${config.colors.surface};
        @define-color view_fg_color ${config.colors.on_surface};
        @define-color card_bg_color ${config.colors.surface};
        @define-color card_fg_color ${config.colors.on_surface};
        @define-color sidebar_bg_color @window_bg_color;
        @define-color sidebar_fg_color @window_fg_color;
        @define-color sidebar_border_color @window_bg_color;
        @define-color sidebar_backdrop_color @window_bg_color;
    '';

    xdg.configFile."gtk-3.0/gtk.css".text = ''
        @define-color accent_color ${config.colors.primary_fixed_dim};
        @define-color accent_fg_color ${config.colors.on_primary_fixed};
        @define-color accent_bg_color ${config.colors.primary_fixed_dim};
        @define-color window_bg_color ${config.colors.surface_dim};
        @define-color window_fg_color ${config.colors.on_surface};
        @define-color headerbar_bg_color ${config.colors.surface_dim};
        @define-color headerbar_fg_color ${config.colors.on_surface};
        @define-color popover_bg_color ${config.colors.surface_dim};
        @define-color popover_fg_color ${config.colors.on_surface};
        @define-color view_bg_color ${config.colors.surface};
        @define-color view_fg_color ${config.colors.on_surface};
        @define-color card_bg_color ${config.colors.surface};
        @define-color card_fg_color ${config.colors.on_surface};
        @define-color sidebar_bg_color @window_bg_color;
        @define-color sidebar_fg_color @window_fg_color;
        @define-color sidebar_border_color @window_bg_color;
        @define-color sidebar_backdrop_color @window_bg_color;
    '';
}
