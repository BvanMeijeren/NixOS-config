{ config, pkgs, ... }:

{
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;

  # Optional but recommended for ThinkPads / Dell laptops
  services.tlp.settings = {
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  };
}
