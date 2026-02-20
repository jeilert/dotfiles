#!/bin/bash

echo "=== Dotfiles Installer ==="
echo ""

USERNAME=$(whoami)

# Always run from the dotfiles directory
cd "$(dirname "$0")"

# Install Visual Studio Code
bash scripts/install-vscode.sh

# Install Google Chrome
bash scripts/install-chrome.sh

# Install Claude Code
bash scripts/install-claude-code.sh

# Install nvm, Node.js, and npm
bash scripts/install-node.sh

# Create directories
mkdir -p ~/Work
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/applications
mkdir -p ~/.local/share/icons

# Copy scripts
cp scripts/create-webapp.sh ~/.local/bin/
chmod +x ~/.local/bin/create-webapp.sh

# Copy icons
cp icons/* ~/.local/share/icons/

# Copy desktop files and replace placeholder username with actual username
for file in applications/*.desktop; do
    sed "s|/home/[^/]*|/home/$USERNAME|g" "$file" > ~/.local/share/applications/$(basename "$file")
done

# Refresh
update-desktop-database ~/.local/share/applications/

echo ""
echo "Done! Log out and back in for apps to appear."
