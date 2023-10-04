{ config, pkgs, xdg, lib, ... }:

{
  home = {
    enableNixpkgsReleaseCheck = false;
    username = "gabriel";
    packages = pkgs.callPackage ./packages.nix {};
    stateVersion = "23.05";
    homeDirectory = lib.mkDefault "/home/gabriel";
    
    file.".xinitrc".source = ./config/xinit;
  };

  xdg = {
    enable = true;
    configFile."nvim" = { source = ./config/neovim;};
  };

}
