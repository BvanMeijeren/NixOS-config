{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  # Enable GNOME desktop Environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
