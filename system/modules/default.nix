{lib, pkgs, config, ...}:
with lib; let
    base = config.module.base;
    desktop = config.module.desktop;
    development = config.module.development;
    games = config.module.games;
    surface = config.module.surface;
    tools = config.module.tools;
in {
    imports = [
        (import ./base {lib = lib; pkgs = pkgs; config = config; enabled = config.module.base.enable; })
        (import ./desktop {lib = lib; pkgs = pkgs; config = config; enabled = config.module.desktop.enable; })
        (import ./development {lib = lib; pkgs = pkgs; config = config; enabled = config.module.development.enable; })
        (import ./games {lib = lib; pkgs = pkgs; config = config; enabled = config.module.games.enable; })
        (import ./surface {lib = lib; pkgs = pkgs; config = config; enabled = config.module.surface.enable; })
        (import ./tools {lib = lib; pkgs = pkgs; config = config; enabled = config.module.tools.enable; })
    ];
    options.module = {
        base.enable = mkEnableOption "base module";
        desktop.enable = mkEnableOption "desktop module";
        development.enable = mkEnableOption "development module";
        games.enable = mkEnableOption "games module";
        surface.enable = mkEnableOption "surface module";
        tools.enable = mkEnableOption "tools module";
    };
}
