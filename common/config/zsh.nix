{ ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };
}
