#!/bin/bash

echo "=== Web App Creator ==="
echo ""

# Prompt for inputs
read -p "App name (e.g. Outlook): " APP_NAME
read -p "App URL (e.g. https://outlook.live.com): " APP_URL
echo ""
echo "Find your icon at: https://dashboardicons.com/"
echo "Click your icon, copy the PNG url and paste it below."
echo ""
read -p "Icon PNG URL: " ICON_URL

# Derived variables
USERNAME=$(whoami)
ICON_FILENAME=$(basename "$ICON_URL")
ICON_PATH="/home/$USERNAME/.local/share/icons/$ICON_FILENAME"
APP_SLUG=$(echo "$APP_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
DESKTOP_FILE="/home/$USERNAME/.local/share/applications/${APP_SLUG}.desktop"
WM_CLASS=$(echo "$APP_URL" | sed 's/https:\/\///' | sed 's/\/.*//')

# Validate it's a PNG url
if [[ "$ICON_URL" != *.png ]]; then
    echo "Error: URL must end in .png"
    exit 1
fi

# Create directories
mkdir -p ~/.local/share/icons
mkdir -p ~/.local/share/applications

# Download icon
echo "Downloading icon..."
if curl -fo "$ICON_PATH" "$ICON_URL"; then
    echo "Icon downloaded successfully."
else
    echo "Failed to download icon. Check the URL and try again."
    exit 1
fi

# Create desktop file
cat > "$DESKTOP_FILE" << EOF
[Desktop Entry]
Name=$APP_NAME
Comment=$APP_NAME Web App
Exec=google-chrome --app=$APP_URL
Icon=$ICON_PATH
Terminal=false
Type=Application
Categories=Network;
StartupWMClass=$WM_CLASS
EOF

# Refresh desktop database
update-desktop-database ~/.local/share/applications/

echo ""
echo "Done! '$APP_NAME' web app created. Search for it in your app grid."
