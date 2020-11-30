#!/usr/bin/env bash

# Update
echo "Updating Packages"
sudo apt-get update

# git
echo "Installing git"
sudo apt install git

# curl
echo "Installing curl"
sudo apt install curl

# nvm
echo "Installing nvm"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh)"

# zsh
echo "Installing zsh"
sudo apt install zsh

# oh-my-zsh
echo "Installing Oh-My-Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# kind
echo "Installing Kind"
curl -sLo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/bin/kind

# pfetch
echo "Installing pfetch"
curl -sLo ./pfetch https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch
sudo mv ./pfetch /usr/bin/pfetch
