{ lib, inputs, pkgs, user, home-manager, nixvim, ags, ... }: {
    avery = { 
        imports = [
            nixvim.homeManagerModules.nixvim
            ags.homeManagerModules.default
            ./avery/base
            ./avery/desktop
        ];
    };
}
