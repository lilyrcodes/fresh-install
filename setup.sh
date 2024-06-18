#!/bin/bash

set -e

# The basics, update and install stuff from package manager
apt-get update
apt-get upgrade -y
cat install_by_pkg_mgr.txt | xargs apt-get install -y

# neovim
curl -o- https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
mv nvim-linux64/bin/nvim /usr/bin/nvim
rm -rf nvim-linux64
rm nvim-linux64.tar.gz

# npm and node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install node

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
