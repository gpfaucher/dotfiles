{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager";
    devshell.url = "github:numtide/devshell";
    android-nixpkgs.url = "github:tadfisher/android-nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    flake-utils.url = "github:numtide/flake-utils";

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
  outputs = { self, nixpkgs, flake-utils, home-manager, nix-homebrew, homebrew-core, homebrew-cask, darwin, android-nixpkgs, devshell } @inputs:
  let
    linuxSystems = [ "x86_64-linux" ];
    darwinSystems = [ "aarch64-darwin" ];
    forAllSystems = f: nixpkgs.lib.genAttrs (linuxSystems ++ darwinSystems) (system: f system);
    devShell = system: import ./shells { inherit nixpkgs android-nixpkgs system; };
  in
  {
    devShells = forAllSystems devShell;
		nixosConfigurations = {
			nixbox = nixpkgs.lib.nixosSystem {
				specialArgs = inputs;
				modules = [
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.gabriel = import ./nixos/home.nix;
					}
					./nixos
				];
			};
		};
    "nixbook" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = inputs;
      modules = [
        home-manager.darwinModules.home-manager
        # nix-homebrew.darwinModules.nix-homebrew
         # {
        # nix-homebrew = {
        #   enable = true;
        #   user = "gabriel";
        #   # taps = {
        #   #   "homebrew/homebrew-core" = homebrew-core;
        #   #   "homebrew/homebrew-cask" = homebrew-cask;
        #   # };
        #   mutableTaps = false;
        #   autoMigrate = true;
        # };
      # };
        ./darwin
      ];
    };
  };
}
