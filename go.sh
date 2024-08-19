#!/bin/bash

# Looks up the latest version of go and installs it
goversion="$(curl -sL https://go.dev/dl/ | grep -Po '">\Kgo.*\.linux-amd64.tar.gz' | head -n 1)"
curl -sLO "https://go.dev/dl/${goversion}"
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "${goversion}"
rm "${goversion}"
