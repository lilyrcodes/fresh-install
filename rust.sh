#!/bin/bash
# Installs the latest version of Rust.

set -e

echo "Downloading and installing rust..." 1>&2
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
chmod +x rustup.sh
./rustup.sh -y
rm rustup.sh
