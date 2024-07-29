{ inputs, ... }: {
    avery = { 
        imports = [
            ./modules/color.nix
            inputs.nixvim.homeManagerModules.nixvim
            inputs.ags.homeManagerModules.default
            inputs.matugen.nixosModules.default
            ./avery/base
            ./avery/desktop
        ];
    };
}
