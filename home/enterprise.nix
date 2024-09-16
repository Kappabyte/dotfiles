{ inputs, ... }: {
    avery = { 
        imports = [
            inputs.nixvim.homeManagerModules.nixvim
            inputs.ags.homeManagerModules.default
            ./avery/base
            ./avery/enterprise
        ];
    };
}
