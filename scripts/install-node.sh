#!/bin/bash

echo "=== Installing nvm, Node.js, and npm ==="
echo ""

# Install nvm (Node Version Manager)
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Load nvm without requiring a new shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# Install latest LTS version of Node.js (includes npm)
echo ""
echo "Installing Node.js LTS..."
nvm install --lts
nvm use --lts

# Verify
echo ""
node --version && echo "Node.js installed successfully!" || echo "Node.js installation failed."
npm --version && echo "npm installed successfully!" || echo "npm installation failed."

echo ""
echo "nvm, Node.js, and npm are ready. Open a new terminal or run: source ~/.bashrc"
