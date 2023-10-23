{ pkgs, ... }:

let
  shared-system-packages =
    import ../common/system-packages.nix { inherit pkgs; };
in {
  imports = [ ./hardware.nix ];

  wsl.enable = true;
  wsl.defaultUser = "gabriel";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone & locale.
  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure console keymap
  console.keyMap = "us";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gabriel = {
    isNormalUser = true;
    description = "Gabriel";
    extraGroups = [ "networkmanager" "wheel" "docker" "audio" ];
    packages = with pkgs; [ zsh ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  virtualisation.docker.enable = true;

  environment.systemPackages = [ ] ++ shared-system-packages;
  environment.pathsToLink = [ "/share/zsh" ];

  programs.zsh.enable = true;
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = false;
    character = {
      success_symbol = "[➜](bold green)";
      error_symbol = "[✗](bold red)";
    };
  };

  security.sudo.wheelNeedsPassword = false;

  # Don't allow emergency mode, because we don't have a console.
  systemd.enableEmergencyMode = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "23.05"; # Did you read the comment?
}
