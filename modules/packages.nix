{ config, pkgs, ... }:

{
  users.users.bastiaan.packages = with pkgs; [
    steam firefox neovim spotify reaper git alacritty
    curl yazi tmux lazygit docker clang nodejs
  ];

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [];
}
