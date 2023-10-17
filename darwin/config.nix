{
    imports = [../common/config];

    home = {
      enableNixpkgsReleaseCheck = false;
    #   home.packages = pkgs.callPackage ./packages.nix {};
      stateVersion = "23.05";
    };
}