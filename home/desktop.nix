{ lib, inputs, pkgs, user, home-manager, nixvim, ... }: {
    avery = { 
        imports = [
            nixvim.homeManagerModules.nixvim
            ./avery/common
            ./avery/desktop
        ];
    };
}
