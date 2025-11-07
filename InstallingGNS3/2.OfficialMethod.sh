#!/bin/bash
# gns3_installer_method.sh

set -e

echo "=== GNS3 Installation using Official Installer ==="

# Update system
echo "Updating system packages..."
sudo apt update
sudo apt upgrade -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y curl wget python3-pip python3-venv git

# Download and run official installer
echo "Downloading GNS3 installer..."
curl -L https://raw.githubusercontent.com/GNS3/gns3-gui/master/scripts/remote-install.sh -o gns3-remote-install.sh

# Make executable and run
chmod +x gns3-remote-install.sh
echo "Running GNS3 installer (this may take a while)..."
./gns3-remote-install.sh --exclude-packages

# Add user to required groups
echo "Configuring user permissions..."
sudo usermod -a -G wireshark $USER
sudo usermod -a -G ubridge $USER

# Configure Wireshark for non-root capture
echo "Configuring Wireshark..."
sudo dpkg-reconfigure wireshark-common -f noninteractive
echo "yes" | sudo tee /etc/wireshark/init.lua > /dev/null 2>&1 || true

echo "=== GNS3 Installation Complete ==="
echo "Please log out and log back in for group changes to take effect."
echo "You can then start GNS3 with: gns3"
