#!/bin/bash
# Looks up the latest version of go and installs it

set -e

echo "Downloading and installing golang..." 1>&2
goversion="$(curl -sL https://go.dev/dl/ | grep -Po '">\Kgo.*\.linux-amd64.tar.gz' | head -n 1)"
echo "Latest go version found: ${goversion}" 1>&2
curl -sLO "https://go.dev/dl/${goversion}"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "${goversion}"
rm "${goversion}"
