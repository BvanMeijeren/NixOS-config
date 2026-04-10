{ config, pkgs, ... }:

{
  # Defined users
  users.users.bastiaan = {
    isNormalUser = true;
    description = "bastiaan";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
