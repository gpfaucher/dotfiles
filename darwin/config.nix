{pkgs, ...}:
{
    imports = [../common/config];

    home = {
      enableNixpkgsReleaseCheck = false;
      packages = pkgs.callPackage ./packages.nix {};
      stateVersion = "23.05";
    };
}