{ config, pkgs, ... }:

{
# Put packages to be installed here (user level)
  users.users.bastiaan.packages = with pkgs; [
    steam firefox neovim spotify reaper git alacritty
    curl yazi tmux lazygit docker clang nodejs
  ];

  # enable services
  programs.firefox.enable = true;
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [];
}
