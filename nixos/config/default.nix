{ pkgs, xdg, ... }:

{
  imports = [ ./fish.nix ./tmux.nix ];

  xdg = {
    enable = true;
    configFile."nvim" = { source = ./nvim; };
    configFile."picom/picom.conf" = { source = ./picom.conf; };
    configFile."xmonad/xmonad.hs" = { source = ./xmonad.hs; };
    configFile."alacritty/alacritty.yml" = { source = ./alacritty.yml; };
  };
}
