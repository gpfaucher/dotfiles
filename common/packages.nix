{ pkgs }:

with pkgs; [
  gnumake
  cmake
  home-manager
  black
  isort
  prettierd
  tmux
  cargo
  rustc

  fontconfig

  nix-your-shell
  unzip

  # Utilities
  tmuxp

  # Formatters
  stylua
  nixfmt
  stylish-haskell
  direnv
  python311Packages.mdformat

  grc

  # PDF
  zathura

  jetbrains-mono
  nodejs_latest
  watchman
]
