{ pkgs, lib, inputs, ... }: {
    avery = { 
        imports = [
            ./modules/color.nix
            inputs.nixvim.homeManagerModules.nixvim
            inputs.ags.homeManagerModules.default
            ./avery/base
            ./avery/laptop
        ];
    };
}
