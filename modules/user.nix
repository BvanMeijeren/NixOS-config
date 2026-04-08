{ config, pkgs, ... }:

{
  users.users.bastiaan = {
    isNormalUser = true;
    description = "bastiaan";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
