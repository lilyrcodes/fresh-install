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

cargo install --locked zellij

ssh-keygen -t ed25519 -C "$1"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "Here's your public SSH key for github:"
echo
cat ~/.ssh/id_ed25519.pub
echo
echo

read -p "Please add it by navigating to https://github.com/settings/ssh/new then press enter to continue..." unused_var

git clone git@github.com:lilyrcodes/dotfiles.git ~/
git clone git@github.com:lilyrcodes/zellij.git ~/.config/
git clone git@github.com:lilyrcodes/nvim.git ~/.config/
