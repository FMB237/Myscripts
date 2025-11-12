#bin/bash
#This script is been added to solve the problem face with ssh
#Mainly the connection from by VM to me host machine 

#Let update our pc repositories
sudo apt update && sudo apt upgrade -y
#Installing libvirt-daemon-system
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager -y

#enable the libvirt-daemon services
sudo systemctl enable --now libvirtd
sudo systemctl status libvirtd


