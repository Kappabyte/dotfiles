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
        matugen = {
            url = "github:/InioX/Matugen?rev=1d09b15b4fa63b16e2a63c47c835c87ecc78ee38";
			inputs.nixpkgs.follows = "nixpkgs";
        };
  	};

  	outputs = inputs @ { nixpkgs, home-manager, nixos-hardware, muse-sounds-manager, ... }:
	let
		user = "avery";
	in {
		nixosConfigurations = (
			import ./system/host {
				inherit (nixpkgs) lib;
				inherit inputs nixpkgs user home-manager nixos-hardware muse-sounds-manager;
			}
		);
	};
}
