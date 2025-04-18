{ ... }: {
  imports =
    [ (import ./git.nix) ]
    ++ [ (import ./zathura.nix) ]
    ++ [ (import ./packages.nix) ]
    ++ [ (import ./wofi.nix) ]
    ++ [ (import ./fish.nix) ]
    ++ [ (import ./tmux.nix) ]
    ++ [ (import ./terminal.nix) ]
    ++ [ (import ./nvim) ]
    ++ [ (import ./scripts) ]
    ++ [ (import ./wayland.nix) ];
}
