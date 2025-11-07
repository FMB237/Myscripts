#bin/bash


#First add  the GNS3 repository
echo "Adding GNS3 repository"
sudo add-apt-repository ppa:gns3/ppa
sudo apt update
sudo apt install gns3-gui gns3-server

#let add IOU support 
echo"Adding IOU Support"
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install gns3-iou

#remove add verison of docker
echo "Removing old Docker"
sudo apt remove docker docker-engine docker.io
sudo snap remove docker

#Continue the process
echo "Continuting Installtion"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

#import Docker official GPG Keys
echo "Adding Docker Keys"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Add the appropriate repo:
echo "Initializing"
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(. /etc/os-release && echo $VERSION_CODENAME) stable"

#Install Docker-CE:
echo "Installing Docker"
sudo apt update
sudo apt install docker-ce

#Finally enable user usage
echo "Checking Users"
sudo usermod -aG ubridge,libvirt,kvm,wireshark,docker $(whoami)


