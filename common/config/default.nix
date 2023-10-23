{ pkgs, xdg, ... }:

{
  imports = [ ./fish.nix ./tmux.nix ./zsh.nix ];

  xdg = {
    enable = true;
    configFile."nvim" = { source = ./nvim; };
    configFile."alacritty/alacritty.toml" = { source = ./alacritty.toml; };
  };
}
