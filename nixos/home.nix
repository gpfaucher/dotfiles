{ config, pkgs, xdg, lib, android-nixpkgs,  ... }:

{

  # android-sdk.enable = true;
  #
  # # Optional; default path is "~/.local/share/android".
  # android-sdk.path = "${config.home.homeDirectory}/.android/sdk";
  #
  # android-sdk.packages = sdkPkgs: with sdkPkgs; [
  #   build-tools-31-0-0
  #   cmdline-tools-latest
  #   emulator
  #   platforms-android-31
  #   sources-android-31
  # ];

  home = {
    enableNixpkgsReleaseCheck = false;
    username = "gabriel";
    packages = pkgs.callPackage ./packages.nix {};
    stateVersion = "23.05";
    homeDirectory = lib.mkDefault "/home/gabriel";

    file.".xinitrc".source = ./config/xinitrc;
  };

  xdg = {
    enable = true;
    configFile."nvim" = { source = ./config/nvim;};
    configFile."picom/picom.conf" = { source = ./config/picom.conf;};
    configFile."xmonad/xmonad.hs" = { source = ./config/xmonad.hs;};
    configFile."alacritty/alacritty.yml" = { source = ./config/alacritty.yml;};
  };

  programs.fish = {
    enable = true;
    shellInit = ''
      if command -q nix-your-shell
        nix-your-shell fish | source
      end
    '';
    interactiveShellInit = ''
      set fish_greeting

    '';
    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "done"; src = pkgs.fishPlugins.done.src; }
      { name = "pisces"; src = pkgs.fishPlugins.pisces.src; }
      { name = "colored-man-pages"; src = pkgs.fishPlugins.colored-man-pages.src; }
    ];
  };
}
