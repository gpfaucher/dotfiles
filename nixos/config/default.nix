{ pkgs, xdg, ... }:

{
  imports = [ ./fish.nix ./tmux.nix ];

  xdg = {
    enable = true;
    configFile."nvim" = { source = ./config/nvim; };
    configFile."picom/picom.conf" = { source = ./config/picom.conf; };
    configFile."xmonad/xmonad.hs" = { source = ./config/xmonad.hs; };
    configFile."alacritty/alacritty.yml" = { source = ./config/alacritty.yml; };
  };
}
