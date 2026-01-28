#!/bin/bash
# ===============================================
# Script: install_vmm.sh
# Purpose: Install Virtual Machine Manager (VMM)
#          + KVM/QEMU on Linux Mint 22.3
# Author: Bruce
# ===============================================

echo "🔄 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "💻 Installing Virtual Machine Manager and dependencies..."
sudo apt install -y virt-manager qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

echo "👤 Adding user $USER to libvirt and kvm groups..."
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER

echo "🚀 Enabling and starting libvirt service..."
sudo systemctl enable --now libvirtd
sudo systemctl start libvirtd

echo "✅ Installation complete!"
echo "⚠️ Log out and log back in for group changes to take effect."
echo "💡 You can now run 'virt-manager' from terminal or menu."
