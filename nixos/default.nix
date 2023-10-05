{ config, pkgs, ... }:

{
  imports = [ ./hardware.nix ];

  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  networking.hostName = "nixbox";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    screenSection = ''
      Option "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
      Option "AllowIndirectGLXProtocol" "off"
      Option "TripleBuffer" "on"
    '';
    libinput.enable = true;
    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = haskellPackages: [
          haskellPackages.xmonad-contrib
        ];
      };
    };
    displayManager = {
      defaultSession = "none+xmonad";
      startx.enable = true;
    };
    videoDrivers = ["nvidia"];
  };

  # Configure console keymap
  console.keyMap = "us";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gabriel = {
    isNormalUser = true;
    description = "Gabriel";
    extraGroups = [ "networkmanager" "wheel" "docker" "audio"];
    packages = with pkgs; [ fish ];
    shell = pkgs.fish;
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  virtualisation.docker.enable = true;

  sound.enable = true;
  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
      driSupport = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      # powerManagement.finegrained = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;

    };
    bluetooth.enable = true;
    pulseaudio.enable = true;
  };

  services.blueman.enable = true;
  services.picom.enable = true;

  environment.systemPackages = with pkgs; [
   vim
   wget
   neovim
   git
   gcc
   ripgrep
   grc

   # Fish shell plugins
   fishPlugins.done
   fishPlugins.colored-man-pages
   fishPlugins.pisces
   fishPlugins.grc
   starship

  ];
  programs.fish.enable = true;
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = false;
    character = {
      success_symbol = "[➜](bold green)";
      error_symbol = "[✗](bold red)";
    };
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "23.05"; # Did you read the comment?
}
