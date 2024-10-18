{
  	description = "My Personal NixOS System Flake Configuration";

  	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-fixes.url = "github:NixOS/nixpkgs/91a7822b04fe5e15f1604f9ca0fb81eff61b4143";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

        nixos-hardware = {
            url = "github:NixOS/nixos-hardware/master";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
        };
        ags.url = "github:Aylur/ags";

        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

        hycov={
            url = "github:DreamMaoMao/hycov";
            inputs.hyprland.follows = "hyprland";
        };
        muse-sounds-manager = {
            url = "github:thilobillerbeck/muse-sounds-manager-nix";
        };
        stylix.url = "github:danth/stylix";
        zls.url = "github:Kappabyte/zls";
  	};

  	outputs = inputs @ { nixpkgs, home-manager, nixos-hardware, muse-sounds-manager, stylix, ... }:
	let
		user = "avery";
	in {
		nixosConfigurations = (
			import ./system/host {
				inherit (nixpkgs) lib;
				inherit inputs nixpkgs user home-manager nixos-hardware muse-sounds-manager stylix;
			}
		);
	};
}
