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
  	};

  	outputs = inputs @ { self, nixpkgs, home-manager, nixos-hardware, nixvim, ... }:
	let
		user = "avery";
	in {
		nixosConfigurations = (
			import ./machine {
				inherit (nixpkgs) lib;
				inherit inputs nixpkgs user home-manager nixos-hardware nixvim;
			}
		);
	};
}
