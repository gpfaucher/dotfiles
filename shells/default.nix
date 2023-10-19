{ nixpkgs, android-nixpkgs, system }:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  buildToolsVersion = "30.0.3";

  android-sdk = android-nixpkgs.sdk.${system} (sdkPkgs:
    with sdkPkgs; [
      # Useful packages for building and testing.
      build-tools-30-0-2
      cmdline-tools-latest
      emulator
      platform-tools
      platforms-android-34
      # ndk-26-0-10792818
      ndk-bundle

      # Other useful packages for a development environment.
      sources-android-34
      system-images-android-34-google-apis-x86-64
      system-images-android-34-google-apis-playstore-x86-64
    ]);

  android-studio = pkgs.androidStudioPackages.stable;
in {
  default = with pkgs;
    mkShell {
      nativeBuildInputs = with pkgs; [ ruby ];
      shellHook = ''
        export EDITOR=vim
      '';
    };
  mobile = with pkgs;
    mkShell rec {
      nativeBuildInputs = with pkgs; [
        android-studio
        android-sdk
        jdk20
        aapt
        flutter
        # gradle
        (writeShellScriptBin "gradle" ''
          ${gradle}/bin/gradle -Dorg.gradle.project.android.aapt2FromMavenOverride=${android-sdk}/share/android-sdk/build-tools/33.0.2/aapt2 "$@"'')
      ];
      shellHook = with pkgs; ''
          tmux
          set -Ux ANDROID_SDK_ROOT "${android-sdk}/share/android-sdk"
          set -Ux GRADLE_OPTS  "-Dorg.gradle.project.android.aapt2FromMavenOverride=$ANDROID_SDK_ROOT/build-tools/34.0.0/aapt2"
          set -Ux JAVA_HOME "${jdk20.home}";
        # EDITOR = "nvim";
      '';
    };
}
