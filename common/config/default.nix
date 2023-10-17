{ pkgs, xdg, ... }:

{
  imports = [ ./fish.nix ./tmux.nix ];

  xdg = {
    enable = true;
    configFile."nvim" = { source = ./nvim; };
    configFile."alacritty/alacritty.yml" = { source = ./alacritty.yml; };
  };
}
