{ pkgs }:

with pkgs; [
  gnumake
  cmake
  home-manager
  black
  isort
  prettierd
  tmux

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

  grc

  # PDF
  zathura

  jetbrains-mono
  nodejs_latest
  watchman
]