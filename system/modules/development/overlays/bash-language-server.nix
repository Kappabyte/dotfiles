{ inputs, ... }: {
    nixpkgs.overlays = [(final: prev: {
         nodePackages = prev.nodePackages // {
             inherit (inputs.nixpkgs-fixes.legacyPackages.${prev.system}.nodePackages) bash-language-server;
         };
    })];
}
