{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      if command -q nix-your-shell
        nix-your-shell fish | source
      end
    '';
    interactiveShellInit = ''
      set fish_greeting

    '';
    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "pisces";
        src = pkgs.fishPlugins.pisces.src;
      }
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
    ];
  };
}
