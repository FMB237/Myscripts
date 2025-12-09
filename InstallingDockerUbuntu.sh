#!/bin/bash
# This is a simple script used to install Docker on an Ubuntu VM

set -e  # Exit on any error

echo "=========================================="
echo "Docker Installation Script for Ubuntu By FMB237 😀"
echo "=========================================="

echo -e "\n[1/7] Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo -e "\n[2/7] Installing required dependencies..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

echo -e "\n[3/7] Adding Docker GPG keys..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo -e "\n[4/7] Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo -e "\n[5/7] Installing Docker engine..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo -e "\n[6/7] Setting up Docker services..."
sudo systemctl start docker
sudo systemctl enable docker

echo -e "\n[7/7] Verifying installation..."
docker_version=$(sudo docker --version)
echo "Docker Version: $docker_version"

echo -e "\nRunning test container..."
sudo docker run --rm hello-world

echo -e "\nAdding current user to Docker group..."
sudo usermod -aG docker $USER

echo -e "\n=========================================="
echo "✅ Docker installation completed successfully!"
echo "=========================================="
echo ""
echo "⚠️  IMPORTANT: Please log out and log back in"
echo "   for group changes to take effect."
echo ""
echo "After logging back in, test without sudo:"
echo "   docker run hello-world"
echo ""
echo "To check Docker status:"
echo "   systemctl status docker"
echo "=========================================="
