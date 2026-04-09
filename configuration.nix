{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/system.nix
    ./modules/desktop.nix
    # ./modules/power.nix
    ./modules/audio.nix
    ./modules/user.nix
    ./modules/packages.nix
  ];
}
