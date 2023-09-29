{
  description = "A very basic flake";
  inputs= {
	nixpkgs.url = "github:NixOS/nixpkgs/master";
	home-manager.url = "github:nix-community/home-manager";
  };
  outputs = { self, nixpkgs, home-manager } @inputs: {
    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

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
  };
}
