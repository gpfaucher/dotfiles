{ pkgs, ... }:
with pkgs;

let common-packages = import ../common/packages.nix { inherit pkgs; };
in common-packages ++ [
  _1password-gui

  vlc

  alacritty_git
  firefox_nightly

  # Formatters

  # Haskell
  stack
  cabal-install
  haskellPackages.hoogle
  haskellPackages.ghcide
  haskellPackages.gtk2hs-buildtools

  # Audio
  cava
  pavucontrol
  spotify

  cypress
  rofi

  # Media Capture
  flameshot
  simplescreenrecorder

  # Visual Tools
  feh
  hsetroot

  picom
  xclip
]
