{ pkgs, ... }:
with pkgs;

let common-packages = import ../common/packages.nix { inherit pkgs; };
in [
  _1password-gui

  vlc

  alacritty
  firefox

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
