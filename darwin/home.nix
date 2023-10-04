{ config, pkgs, lib, home-manager, ... }:

{
  imports = [ ./dock.nix];

  users.users."gabriel" = {
    name = "gabriel";
    home = "/Users/gabriel";
    isHidden = false;
    shell = pkgs.fish;
  };

  # This is a module from nix-darwin
  # Homebrew is *installed* via the flake input nix-homebrew
#   homebrew.enable = true;
#   homebrew.casks = pkgs.callPackage ./casks.nix {};
# 
  # These app IDs are from using the mas CLI app
  # mas = mac app store
  # https://github.com/mas-cli/mas
  #
  # $ nix shell nixpkgs#mas
  # $ mas search <app name>
  #
#   homebrew.masApps = {
#     "1password" = 1333542190;
#     "canva" = 897446215;
#     "drafts" = 1435957248;
#     "hidden-bar" = 1452453066;
#     "wireguard" = 1451685025;
#     "yoink" = 457622435;
#   };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users."gabriel" = { pkgs, config, lib, ... }:{
      home.enableNixpkgsReleaseCheck = false;
    #   home.packages = pkgs.callPackage ./packages.nix {};

      home.stateVersion = "23.05";
    #   programs = {} // import ../shared/home-manager.nix { inherit config pkgs lib; };

      # Marked broken Oct 20, 2022 check later to remove this
      # https://github.com/nix-community/home-manager/issues/3344
      manual.manpages.enable = false;
    };
  };

  # Fully declarative dock using the latest from Nix Store
  local.dock.enable = true;
  local.dock.entries = [
    { path = "${pkgs.alacritty}/Applications/Alacritty.app/"; }
    {
      path = "${config.users.users."gabriel".home}/.local/share/";
      section = "others";
      options = "--sort name --view grid --display folder";
    }
    {
      path = "${config.users.users."gabriel".home}/.local/share/downloads";
      section = "others";
      options = "--sort name --view grid --display stack";
    }
  ];

}