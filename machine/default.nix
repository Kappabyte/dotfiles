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
                    inherit lib inputs pkgs user home-manager;
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
            nixos-hardware.nixosModules.microsoft-surface-pro-intel {
                microsoft-surface.kernelVersion = "6.1.18";
                microsoft-surface.ipts.enable = lib.mkForce false; # Using a custom service that doesn't crash. See custom/services/iptsd.nix
            }
            ./common
            ./laptop
            home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users = (import ../home/laptop.nix {
                    inherit lib inputs pkgs user home-manager;
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
                    inherit lib inputs pkgs user home-manager;
                });
            }
        ];
    };
}
