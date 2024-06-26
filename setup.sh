#!/bin/bash

set -e

# The basics, update and install stuff from package manager
sudo apt-get update
sudo apt-get upgrade -y
cat install_by_pkg_mgr.txt | xargs sudo apt-get install -y

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc

# npm and node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
chmod +x rustup.sh
./rustup.sh -y
rm rustup.sh
. "$HOME/.cargo/env"

# zellij
cargo install --locked zellij

# go
curl -LO https://go.dev/dl/go1.22.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
rm go1.22.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

git clone git@github.com:lilyrcodes/dotfiles.git ~/dotfiles
git clone git@github.com:lilyrcodes/zellij.git ~/.config/zellij
git clone git@github.com:lilyrcodes/kickstart.nvim.git ~/.config/nvim

echo "Please follow the steps in https://github.com/lilyrcodes/dotfiles?tab=readme-ov-file#easy-setup to complete dotfiles setup."
