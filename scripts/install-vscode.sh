#!/bin/bash

echo "=== Installing Visual Studio Code ==="
echo ""

# Add Microsoft repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo cat > /etc/yum.repos.d/vscode.repo << EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

# Install
sudo dnf install code -y

echo ""
echo "Done! Visual Studio Code installed."
