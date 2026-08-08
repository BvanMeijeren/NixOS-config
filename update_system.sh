cd /home/bastiaan/Documents/git/
# Run the following command from the Documents/git directory to update system
sudo nixos-rebuild switch --flake /home/bastiaan/Documents/git/NixOS-config#nixos

# clean up old builds, keep last 3
sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +3
sudo nix-collect-garbage
