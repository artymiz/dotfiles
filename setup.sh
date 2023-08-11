#!/bin/sh
cwd=$(pwd)
sudo apt update -y
# install C++ tool chain
sudo apt-get install -y ninja-build gettext libssl-dev libtool libtool-bin
autoconf automake cmake g++ pkg-config unzip clangd-12

sudo apt-get install -y python3-pip

# install version control and file retrieval tools
sudo apt-get install -y curl file git wget ssh

# install xclip if not using wsl
# if ! grep -qi microsoft /proc/version; then
    sudo apt-get install -y xclip
# fi


# install neovim Nightly with tarball
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
sudo tar -xzvf nvim-linux64.tar.gz -C /opt
# create symbolic link to usr bin
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim

#install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#zsh
sudo apt install zsh -y
chsh -s $(which zsh)

#zsh plugins
git clone https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh/zsh-completions.git

# install lsd for ls with nerd font icons
wget https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb
sudo dpkg -i lsd_0.23.1_amd64.deb
rm lsd_0.23.1_amd64.deb

# copy zshrc
cp .zshrc ~
source ~/.zshrc

# install packer for neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# ripgrep to use plugin features
sudo apt-get install ripgrep

# setup nvim config
git clone git@github.com:ThePrimeagen/init.lua.git ~/.config/nvim
