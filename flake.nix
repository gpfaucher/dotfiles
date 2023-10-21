{
  description =
    "A flaked Nix configuration for a NixOS workstation and a MacOS system using nix & homebrew";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager";
    devshell.url = "github:numtide/devshell";
    android-nixpkgs.url = "github:tadfisher/android-nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    flake-utils.url = "github:numtide/flake-utils";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, flake-utils, home-manager, nix-homebrew
    , homebrew-core, homebrew-cask, darwin, android-nixpkgs, devshell, chaotic
    }@inputs:
    let
      linuxSystems = [ "x86_64-linux" ];
      darwinSystems = [ "aarch64-darwin" ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs (linuxSystems ++ darwinSystems) (system: f system);
      devShell = system:
        import ./shells { inherit nixpkgs android-nixpkgs system; };
    in {
      devShells = forAllSystems devShell;
      nixosConfigurations = {
        nixbox = nixpkgs.lib.nixosSystem {
          specialArgs = inputs;
          modules = [
            home-manager.nixosModules.home-manager
            chaotic.nixosModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.gabriel = import ./nixos/home.nix;
            }
            ./nixos
          ];
        };
        wsnix = nixpkgs.lib.nixosSystem {
          specialArgs = inputs;
          modules = [
            home-manager.nixosModules.home-manager
            chaotic.nixosModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.gabriel = import ./wsl/home.nix;
            }
            ./wsl
          ];
        };
      };
      darwinConfigurations = {
        "nixbook" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = inputs;
          modules = [
            home-manager.darwinModules.home-manager
            nix-homebrew.darwinModules.nix-homebrew
            chaotic.homeManagerModules.default
            {
              nix-homebrew = {
                # Install Homebrew under the default prefix
                enable = true;

                # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
                # enableRosetta = true;

                # User owning the Homebrew prefix
                user = "gabriel";

                # Optional: Declarative tap management
                taps = {
                  "homebrew/homebrew-core" = homebrew-core;
                  "homebrew/homebrew-cask" = homebrew-cask;
                };

                # Optional: Enable fully-declarative tap management
                #
                # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
                mutableTaps = false;
              };
            }
            ./darwin
          ];
        };

      };
    };
}
