{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";
    historyLimit = 100000;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    prefix = "C-Space";
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.resurrect
      tmuxPlugins.tmux-thumbs
    ];
    extraConfig =
      " \n      set -g status-justify centre \n      set-option -g status-style bg=default\n      set-option -g status-style fg=colour3      ";
  };
}
