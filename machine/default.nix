{ lib, inputs, nixpkgs, user, home-manager, nixos-hardware, nixvim, ... }:

let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
    };

    lib = nixpkgs.lib;
in {
    desktop = lib.nixosSystem {
        inherit system;
        specialArgs = {
            inherit inputs user system;
            host = {
                hostName = "desktop";
            };
        };
        modules = [
            ./common
            ./desktop
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users = (import ../home/desktop.nix {
                    inherit lib inputs pkgs user home-manager nixvim;
                });
            }
        ];
    };
    laptop = lib.nixosSystem {
        inherit system;
        specialArgs = {
            inherit inputs user system;
            host = {
                hostName = "laptop";
            };
        };
        modules = [
            nixos-hardware.nixosModules.microsoft-surface-pro-intel
            ./common
            ./laptop
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users = (import ../home/laptop.nix {
                    inherit lib inputs pkgs user home-manager nixvim;
                });
            }
        ];
    };
    usb = lib.nixosSystem {
        inherit system;
        specialArgs = {
            inherit inputs user system;
            host = {
                hostName = "usb";
            };
        };
        modules = [
            ./usb
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users = (import ../home/desktop.nix {
                    inherit lib inputs pkgs user home-manager nixvim;
                });
            }
        ];
    };
}
