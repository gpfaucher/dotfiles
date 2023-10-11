{ lib, pkgs, ... }:

let
  devShell = system:
    let pkgs =  {
      inherit system;
      config.allowUnfree = true;
    };

    android-sdk = buildPackages.android-nixpkgs.sdk.${system} (sdkPkgs: with sdkPkgs; [
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
    default = with pkgs; buildPackages.mkShell {
      nativeBuildInputs = with pkgs; [ ruby ];
      shellHook = with pkgs; ''
        export EDITOR=vim
      '';
    };
    test = with pkgs; buildPackages.mkShell {
      nativeBuildInputs = with pkgs; [ cargo ];
      shellHook = with pkgs; ''
        export EDITOR=vim
      '';
    };
    mobile = with pkgs; buildPackages.mkShell {
      nativeBuildInputs = with pkgs; [ android-studio android-sdk ];
      shellHook = with pkgs; ''
        export EDITOR=vim
      '';
    };
  };
in
devShell
