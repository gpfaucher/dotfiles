{ pkgs }:

with pkgs; [
  vim
  wget
  neovim
  git
  gcc
  ripgrep
  grc

  # Fish shell plugins
  fishPlugins.done
  fishPlugins.colored-man-pages
  fishPlugins.pisces
  fishPlugins.grc
  starship
]
