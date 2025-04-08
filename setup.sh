#!/bin/bash

set -e

# The basics, update and install stuff from package manager
sudo apt-get update
sudo apt-get upgrade -y
cat install_by_pkg_mgr.txt | xargs sudo apt-get install -y

# neovim
./neovim.sh

# npm and node.js
curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node

# rust
./rust.sh
. "$HOME/.cargo/env"

# zellij
cargo install zellij

# go
./go.sh
export PATH=$PATH:/usr/local/go/bin

git clone git@github.com:lilyrcodes/dotfiles.git ~/dotfiles
git clone git@github.com:lilyrcodes/zellij.git ~/.config/zellij
git clone git@github.com:lilyrcodes/kickstart.nvim.git ~/.config/nvim

echo "Please follow the steps in https://github.com/lilyrcodes/dotfiles?tab=readme-ov-file#easy-setup to complete dotfiles setup."
