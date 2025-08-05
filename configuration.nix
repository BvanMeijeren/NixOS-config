# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

# Unwanted packages that come with Gnome need to be excluded  
environment.gnome.excludePackages = (with pkgs; [
  atomix # puzzle game
  cheese # webcam tool
  epiphany # web browser
  evince # document viewer
  geary # email reader
  gedit # text editor
  gnome-characters
  gnome-music
  gnome-photos
  gnome-terminal
  gnome-tour
  hitori # sudoku game
  iagno # go game
  tali # poker game
  totem # video player
]);

### THEME ###
# Font
fonts = {
	packages = with pkgs; [
		alegreya
	];

	# font configuration
	fontconfig = {
		enable = true;
		defaultFonts = {
			serif = [ "Alegreya" ];
		};
	};
};

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

### AUDIO ###
  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

### PERIPHERALS ###
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

### USERS ###
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bastiaan = {
    isNormalUser = true;
    description = "bastiaan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
        firefox
        git
        ghostty
        wget
        unzip
    ];
  };

    # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # System basics    
    firefox
    wget
    curl
    unzip
    openssh
    # Software development-related
    git
    ghostty
    vim 
    nvim
    emacs
    python3
    docker
    postgresql
    nixfmt-rfc-style # official nix formatter
    pgformatter # format postgres SQL
    lazygit # easy git interface for terminals
    yazi
    fd
    ripgrep
    luarocks
    # Audio production
    reaper
  ];

# Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

# Enable Docker
virtualisation.docker.enable = true;
virtualisation.docker.rootless.enable = true;

# Emacs support
services.emacs.enable = true;

### NETWORK ###
# Network
#network.networkmanager.enable = true;

# SSH connections
{
  programs.ssh = {
    startAgent = true;
    # Optional: add known hosts globally
    knownHosts = {
      github = {
        hostNames = [ "github.com" ];
        publicKey = "github.com,140.82.112.4 ssh-ed25519 AAAAC3NzaC1...";
      };
    };
  };

  services.openssh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
