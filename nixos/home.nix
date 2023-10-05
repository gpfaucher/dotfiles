{ config, pkgs, xdg, lib, ... }:

{
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
}
