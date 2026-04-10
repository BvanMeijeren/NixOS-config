{ config, pkgs, ... }:

{
  # this file enables TLP, which is not needed for DEs with inbuilt power management (check configuration.nix)
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;

  # Optional but recommended for ThinkPads / Dell laptops
  services.tlp.settings = {
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  };
}
