{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
     home-manager.url = "github:nix-community/home-manager";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, darwin, home-manager } @inputs: {
    darwinConfigurations = {
          "nixbook" = darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            specialArgs = inputs;
            modules = [
              home-manager.darwinModules.home-manager
              ./darwin.nix
              # nix-homebrew.darwinModules.nix-homebrew
            ];
          };
        };
  };
}
