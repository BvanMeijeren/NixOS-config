#!/usr/bin/env bash

# To execute this script and replace the current etc/nixos/configuration.nix, run:
# sudo ./update_nix_config.sh 

set -euo pipefail

SRC_CONFIG="./configuration.nix"
DEST_CONFIG="/etc/nixos/configuration.nix"
BACKUP="/etc/nixos/configuration.nix.bak"

# Check if the source file exists
if [ ! -f "$SRC_CONFIG" ]; then
  echo "❌ Error: configuration.nix not found in current directory."
  exit 1
fi

# Must be run as root
if [ "$EUID" -ne 0 ]; then
  echo "⚠️ Please run as root: sudo $0"
  exit 1
fi

# Backup current config
echo "🔁 Backing up existing configuration.nix to $BACKUP"
cp "$DEST_CONFIG" "$BACKUP"

# Copy the new config
echo "📥 Replacing /etc/nixos/configuration.nix with the current directory version..."
cp "$SRC_CONFIG" "$DEST_CONFIG"

# Optional: also copy any referenced modules (like `hardware-configuration.nix`)
# if [ -f "./hardware-configuration.nix" ]; then
#   echo "📥 Copying hardware-configuration.nix"
#   cp ./hardware-configuration.nix /etc/nixos/
# fi

# Optionally rebuild immediately
read -p "🚀 Do you want to rebuild the system now? (y/N): " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  nixos-rebuild switch
fi

echo "✅ configuration.nix replaced successfully."
