#!/bin/bash
#This is a bash script that have the role to automate the installations and setting up of note and expressjs on our machines

set -e 

echo "=========================================="
echo "Installing Nodejs and npm on Ubuntu via APT package"
echo "=========================================="

echo -e " \n[1/7]Updatind system packets"
sudo apt update && sudo apt upgrade -y

echo -e '\n[2/7] Installing nodejs and npm'
sudo apt install nodejs npm

echo -e '\n[3/7] Checking if nodejs and npm are correctly install'
node -v && npm -v

echo -e '\n[4/7] Creating Folder and starting learning'
cd ~/Desktop
mkdir ExpressJsCourse && cd ExpressJsCourse

echo -e '\n[5/7]Installing expressJs and initialing our course'
npm install express && npm init -y

echo -e '\n[6/7] Installing require dependencies'
npm install cors && npm install nodemon 

echo -e "\n[7/7]=========================================="
echo "✅ nodejs installation completed successfully!"
echo "=========================================="