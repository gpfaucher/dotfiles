{ pkgs, ...  }:
with pkgs;

[
  _1password-gui
  gnumake
  cmake
  home-manager

  vlc
  fontconfig

  nix-your-shell
  alacritty
  firefox
  unzip
  stylua

  stylish-haskell
  stack
  cabal-install
  haskellPackages.hoogle
  haskellPackages.ghcide
  haskellPackages.gtk2hs-buildtools

  cava
  pavucontrol

  cypress
  chromedriver
  direnv
  rofi

  flameshot

  simplescreenrecorder

  feh
  hsetroot
  zathura
  spotify
  picom
  xclip
  jetbrains-mono
  nodejs_latest
  jdk20
  watchman
]
