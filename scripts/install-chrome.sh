#!/bin/bash

echo "=== Installing Google Chrome ==="
echo ""

# Download the official RPM
curl -o /tmp/google-chrome.rpm https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

# Install it
sudo dnf install /tmp/google-chrome.rpm -y

# Clean up
rm /tmp/google-chrome.rpm

echo ""
echo "Done! Google Chrome installed."

