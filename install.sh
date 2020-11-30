#!/usr/bin/env bash

# Update
update() {
  echo "Updating Packages"
  sudo apt-get update
}

# git
install_git() {
  echo "Installing git"
  sudo apt install git
}

# curl
install_curl() {
  echo "Installing curl"
  sudo apt install curl
}

# nvm
install_nvm() {
  echo "Installing nvm"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh)"
}

# zsh
install_zsh() {
  echo "Installing zsh"
  sudo apt install zsh
}

# oh-my-zsh
install_oh_my_zsh() {
  echo "Installing Oh-My-Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# github cli
install_github() {
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
  sudo apt-add-repository https://cli.github.com/packages
  sudo apt update
  sudo apt install gh
}

# kind
install_kind() {
  echo "Installing Kind"
  curl -sLo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
  chmod +x ./kind
  sudo mv ./kind /usr/bin/kind
}

# pfetch
install_pfetch() {
  echo "Installing pfetch"
  curl -sLo ./pfetch https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch
  sudo mv ./pfetch /usr/bin/pfetch
}

install() {
  
  for pkg in "$@"
  do
    echo $pkg
  done
  
}

INSTALL_OPTIONS=(
    git
    curl
    nvm
    zsh
    oh_my_zsh
    github
    kind
    pfetch
)

# install defaults
install_defaults() {
  install $INSTALL_OPTIONS
}

install $INSTALL_OPTIONS

