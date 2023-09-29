{ config, pkgs, lib, ... }:

{
  home = {
    enableNixpkgsReleaseCheck = false;
    username = "gabriel";
    packages = pkgs.callPackage ./packages.nix {};
    stateVersion = "23.05";
  };
  xdg.configFile."nvim" = { source = ./config/nvim; recursive = true; };

}
