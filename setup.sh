#!/bin/sh
sudo apt update
sudo apt install git
sudo apt install build-essential
sudo apt install zsh
chsh -s $(which zsh)
sudo apt-get install neovim
sudo apt-get install python3-neovim


#zsh plugins
git clone https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# install lsd
wget https://github.com/Peltoche/lsd/releases/download/0.18.0/lsd_0.18.0_amd64.deb
sudo dpkg -i lsd_0.18.0_amd64.deb
rm lsd_0.18.0_amd64.deb

# copy zshrc
cp ./.zshrc ~
source ~/.zshrc

# jupyter install with ipython-sql support
sudo apt install python3-pip
pip3 install --user notebook
pip3 install --user ipython-sql

