{
  	description = "My Personal NixOS System Flake Configuration";

  	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = github:nix-community/home-manager;
			inputs.nixpkgs.follows = "nixpkgs";
		};

        nixos-hardware = {
            url = "github:NixOS/nixos-hardware/master";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
        };
        ags.url = "github:Aylur/ags";

        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

        hycov={
            url = "github:DreamMaoMao/hycov";
            inputs.hyprland.follows = "hyprland";
        };
  	};

  	outputs = inputs @ { self, nixpkgs, home-manager, nixos-hardware, ... }:
	let
		user = "avery";
	in {
		nixosConfigurations = (
			import ./system/host {
				inherit (nixpkgs) lib;
				inherit inputs nixpkgs user home-manager nixos-hardware;
			}
		);
	};
}
