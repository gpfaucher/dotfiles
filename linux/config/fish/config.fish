source ~/.config/fish/themes/kanagawa.fish

# # Start X at login
# if status is-login
#     if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#         exec startx -- -keeptty
#     end
# end

starship init fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/gabriel/.ghcup/bin $PATH # ghcup-env