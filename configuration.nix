{ config, pkgs, ... }:

{
  # List nix files here to enable them in the system
  imports = [
    ./hardware-configuration.nix

    ./modules/system.nix
    ./modules/desktop.nix
    # ./modules/power.nix
    ./modules/graphics.nix
    ./modules/audio.nix
    ./modules/user.nix
    ./modules/packages.nix
  ];
}
