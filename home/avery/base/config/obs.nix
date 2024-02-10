{ lib, inputs, pkgs, user, home-manager, ... }: {
    programs.obs-studio = {
        enable = true;
        #plugins = [pkgs.obs-studio-plugins.advanced-scene-switcher];
    };
}
