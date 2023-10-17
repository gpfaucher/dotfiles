{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      nix-your-shell fish | source
      fish_vi_key_bindings
    '';
  };
}
