#!/bin/bash

echo "=== Installing Claude Code ==="
echo ""

# Install using Anthropic's official native installer
curl -fsSL https://claude.ai/install.sh | bash

# Reload PATH
source ~/.bashrc

# Verify
echo ""
claude --version && echo "Claude Code installed successfully!" || echo "Installation failed. Try opening a new terminal and running: claude --version"

echo ""
echo "Run 'claude' in any project directory to get started."
echo "You will need a Claude Pro, Max, or Anthropic Console account to authenticate."

