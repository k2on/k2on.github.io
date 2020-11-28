#!/usr/bin/env bash

# kind
curl -sLo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/bin/kind

# pfetch
curl -sLo ./pfetch https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch
mv ./pfetch /usr/bin/pfetch
