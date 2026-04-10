{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;

    # Power management (good for laptops)
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    # Use proprietary driver
    open = false;

    # Enable NVIDIA settings menu
    nvidiaSettings = true;

    # Laptop hybrid setup (Optimus)
    prime = {
      offload.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
