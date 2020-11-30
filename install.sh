#!/usr/bin/env bash

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# kind
curl -sLo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/bin/kind

# pfetch
curl -sLo ./pfetch https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch
sudo mv ./pfetch /usr/bin/pfetch
