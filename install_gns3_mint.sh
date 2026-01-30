#!/bin/bash

echo "🔥 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "📦 Installing base dependencies..."
sudo apt install -y \
software-properties-common \
apt-transport-https \
ca-certificates \
curl \
gnupg2

echo "🔑 Adding GNS3 repository..."
curl -fsSL https://archive.gns3.com/repos/apt/gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/gns3.gpg
echo "deb [signed-by=/usr/share/keyrings/gns3.gpg] https://archive.gns3.com/repos/apt stable main" | sudo tee /etc/apt/sources.list.d/gns3.list

sudo apt update

echo "🚀 Installing GNS3 and tools..."
sudo apt install -y \
gns3-gui \
gns3-server \
ubridge \
dynamips \
vpcs \
wireshark \
qemu-system \
qemu-kvm \
virt-manager \
bridge-utils \
uml-utilities \
libpcap-dev \
xfce4-terminal \
xterm \
telnet \
net-tools \
ethtool \
iptables \
ebtables \
dnsmasq-base \
bison flex build-essential git

echo "⚙️ Loading kernel modules..."
sudo modprobe kvm
sudo modprobe kvm_intel 2>/dev/null || sudo modprobe kvm_amd
sudo modprobe bridge
sudo modprobe br_netfilter

echo "🧩 Giving ubridge permissions..."
sudo setcap cap_net_admin,cap_net_raw+ep $(which ubridge)

echo "👤 Adding user to required groups..."
sudo usermod -aG kvm,libvirt,wireshark,netdev,dialout $USER

echo "📡 Fixing Wireshark capture permissions..."
sudo dpkg-reconfigure wireshark-common

echo "✅ Installation complete!"
echo "⚠️ Reboot your system now."
