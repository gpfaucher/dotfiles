# dotfiles

## Getting Started

### Darwin / MacOS

#### 1. Install dependencies

`xcode-select --install`

#### 2. Install Nix

`curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install`

#### 3. Clone repository

`git clone git@gitlab.com:gabrielfaucher/dotfiles.git ~/dev/projects/dotfiles/`

#### 3. Install configuration

`cd ~/dev/projects/dotfiles/ && ./bin/build`

#### 4. Enable global flake access

`nix registry add system ~/dev/projects/dotfiles/`

### NixOS

#### 1. Burn the latest ISO

Download and burn [the minimal ISO image](https://nixos.org/download.html).
Boot the installer and install a minimal NixOS version, until you're able to boot the system, log in and have arrived at a working shell.

#### 2. Clone repository

`git clone git@gitlab.com:gabrielfaucher/dotfiles.git ~/dev/projects/dotfiles/`

#### 3. Install configuration

`cd ~/dev/projects/dotfiles/ && ./bin/build`

#### 4. Set up global flake access

`nix registry add system ~/dev/projects/dotfiles/`

## Known Issues / TODO

- \[ \] Flutter in mobile devShell is broken due to gradle plugin error.
