{ lib, inputs, nixpkgs, user, home-manager, nixos-hardware, ... }:

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
            hostName = "desktop";
        };
        modules = [
            ./desktop
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users = (import ../../home/desktop.nix {
                    inherit lib inputs pkgs user home-manager;
                });
                home-manager.extraSpecialArgs = {
                    inherit inputs;
                };
            }
        ];
    };
    oldlaptop = lib.nixosSystem {
        inherit system;
        specialArgs = {
            inherit inputs user system;
            hostName = "oldlaptop";
        };
        modules = [
            ./oldlaptop
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users = (import ../../home/oldlaptop.nix {
                    inherit lib inputs pkgs user home-manager;
                });
                home-manager.extraSpecialArgs = {
                    inherit inputs;
                };
            }
        ];
    };
    laptop = lib.nixosSystem {
        inherit system;
        specialArgs = {
            inherit inputs user system;
            hostName = "laptop";
        };
        modules = [
            nixos-hardware.nixosModules.microsoft-surface-pro-intel
            ./laptop
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users = (import ../../home/laptop.nix {
                    inherit lib inputs pkgs user home-manager;
                });
                home-manager.extraSpecialArgs = {
                    inherit inputs;
                };
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
                home-manager.users = (import ../../home/desktop.nix {
                    inherit lib inputs pkgs user home-manager;
                });
                home-manager.extraSpecialArgs = {
                    inherit inputs;
                };

            }
        ];
    };
}
