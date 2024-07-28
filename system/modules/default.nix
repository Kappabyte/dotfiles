{lib, pkgs, config, inputs, ...}: {
    imports = [
        (import ./base          {lib = lib; pkgs = pkgs; config = config; inputs = inputs; enabled = config.module.base.enable; })
        (import ./desktop       {lib = lib; pkgs = pkgs; config = config; inputs = inputs; enabled = config.module.desktop.enable; })
        (import ./development   {lib = lib; pkgs = pkgs; config = config; inputs = inputs; enabled = config.module.development.enable; })
        (import ./games         {lib = lib; pkgs = pkgs; config = config; inputs = inputs; enabled = config.module.games.enable; })
        (import ./surface       {lib = lib; pkgs = pkgs; config = config; inputs = inputs; enabled = config.module.surface.enable; })
        (import ./tools         {lib = lib; pkgs = pkgs; config = config; inputs = inputs; enabled = config.module.tools.enable; })
    ];
    options.module = {
        base.enable = lib.mkEnableOption "base module";
        desktop.enable = lib.mkEnableOption "desktop module";
        development.enable = lib.mkEnableOption "development module";
        games.enable = lib.mkEnableOption "games module";
        surface.enable = lib.mkEnableOption "surface module";
        tools.enable = lib.mkEnableOption "tools module";
    };
}
