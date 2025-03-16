{ pkgs, ... }: {
  home.packages = with pkgs; [
    killall
    xdg-utils
    pamixer
    ffmpeg
    unzip
    wget
    hyfetch
    ripgrep
    google-chrome
    playerctl
    zoom-us
    fzf
    nerd-fonts.jetbrains-mono
    hsetroot
    xclip
    tmux-sessionizer
    obsidian
    google-drive-ocamlfuse
    nnn
    mullvad-browser
    foot
    rofi-wayland
  ];
}
