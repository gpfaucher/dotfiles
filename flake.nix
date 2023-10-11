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
    devShell = system:
      let pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      android-sdk = android-nixpkgs.sdk.${system} (sdkPkgs: with sdkPkgs; [
        # Useful packages for building and testing.
        build-tools-30-0-2
        cmdline-tools-latest
        emulator
        platform-tools
        platforms-android-30

        # Other useful packages for a development environment.
        sources-android-30
        system-images-android-30-google-apis-x86
        system-images-android-30-google-apis-playstore-x86
      ]);

      android-studio = pkgs.androidStudioPackages.stable;
    in {
      default = with pkgs; mkShell {
        nativeBuildInputs = with pkgs; [ ruby ];
        shellHook = with pkgs; ''
          export EDITOR=vim
        '';
      };
      mobile = with pkgs; mkShell {
        nativeBuildInputs = with pkgs; [ android-studio android-sdk jdk11 ];
        shellHook = with pkgs; ''
          export EDITOR=vim
          export ANDROID_HOME="${android-sdk}/share/android-sdk"
          export ANDROID_SDK_ROOT="${android-sdk}/share/android-sdk"
          export JAVA_HOME=${jdk11.home}
        '';
      };
    };
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
