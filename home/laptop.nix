{ lib, inputs, pkgs, user, home-manager, nixvim, ags, ... }: {
    avery = { 
        imports = [
            nixvim.homeManagerModules.nixvim
            ./avery/common
            ./avery/laptop
        ];
    };
}
