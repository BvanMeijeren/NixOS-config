{ config, pkgs, ... }:

{
  # enable pipewire audio driver package
  services.pulseaudio.enable = false;

  # Security rootkit
  security.rtkit.enable = true;

  # Pipewire settings
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
