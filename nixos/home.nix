{ config, pkgs, xdg, lib, android-nixpkgs, ... }:

{
  imports = [ ./config ../common/config ];
  home = {
    enableNixpkgsReleaseCheck = false;
    username = "gabriel";
    packages = pkgs.callPackage ./packages.nix { };
    stateVersion = "23.05";
    homeDirectory = lib.mkDefault "/home/gabriel";

    file.".xinitrc".source = ./config/xinitrc;
  };

}
