{ pkgs, ... }:
with pkgs;

[
  _1password-gui
  gnumake
  cmake
  home-manager
  black
  isort
  prettierd
  tmux

  vlc
  fontconfig

  nix-your-shell
  alacritty
  firefox
  unzip

  # Utilities
  tmuxp

  # Formatters
  stylua
  nixfmt
  stylish-haskell

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
  chromedriver
  direnv
  rofi

  # Media Capture
  flameshot
  simplescreenrecorder

  # Visual Tools
  feh
  hsetroot

  # PDF
  zathura

  picom
  xclip
  jetbrains-mono
  nodejs_latest
  watchman
]
