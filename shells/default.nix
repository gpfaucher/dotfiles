{ nixpkgs, android-nixpkgs, system }:

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
  nativeBuildInputs = with pkgs; [ lib ruby ];
  shellHook = ''
    export EDITOR=vim
  '';
};
mobile = with pkgs; mkShell {
  nativeBuildInputs = with pkgs; [ android-studio android-sdk jdk11 gradle ];
  shellHook = with pkgs; ''
    export EDITOR=vim
    export ANDROID_HOME="${android-sdk}/share/android-sdk"
    export ANDROID_SDK_ROOT="${android-sdk}/share/android-sdk"
    export JAVA_HOME=${jdk11.home}
  '';
};
}
