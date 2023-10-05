{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, home-manager, nix-homebrew, homebrew-core, homebrew-cask, darwin } @inputs: {
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
