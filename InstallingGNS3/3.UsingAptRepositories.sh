#!/bin/bash
# gns3_apt_method.sh

set -e

echo "=== GNS3 Installation using APT Repository ==="

# Update system
echo "Updating system..."
sudo apt update
sudo apt upgrade -y

# Add GNS3 PPA
echo "Adding GNS3 repository..."
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:gns3/ppa -y

# Update package list
echo "Updating package list..."
sudo apt update

# Install GNS3 and dependencies
echo "Installing GNS3 packages..."
sudo apt install -y gns3-gui gns3-server
sudo apt install -y dynamips ubridge vpcs wireshark

# Install additional tools
echo "Installing additional networking tools..."
sudo apt install -y qemu-kvm qemu-utils libvirt-daemon-system virt-manager
sudo apt install -y docker.io docker-compose bridge-utils

# Configure user groups
echo "Configuring user groups..."
sudo usermod -a -G wireshark $USER
sudo usermod -a -G ubridge $USER
sudo usermod -a -G kvm $USER
sudo usermod -a -G libvirt $USER
sudo usermod -a -G docker $USER

# Configure Wireshark
echo "Configuring Wireshark for non-root capture..."
sudo dpkg-reconfigure wireshark-common -f noninteractive

# Set capabilities for dynamips
echo "Setting up Dynamips capabilities..."
sudo setcap cap_net_raw,cap_net_admin+ep /usr/bin/dynamips

echo "=== GNS3 APT Installation Complete ==="
echo "Please log out and log back in for group changes to take effect."
echo "Start GNS3 with: gns3"
