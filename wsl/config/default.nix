{ pkgs, xdg, ... }:

{
  xdg = {
    enable = true;
    configFile."picom/picom.conf" = { source = ./picom.conf; };
    configFile."xmonad/xmonad.hs" = { source = ./xmonad.hs; };
  };
}
