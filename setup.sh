#!/bin/sh
apt-get update
sudo apt-get install python3.7

#zsh plugins
git clone https://github.com/bhilburn/powerlevel9k.git ~/.zsh/powerlevel9k
git clone https://github.com/matthieusb/zsh-sdkman.git ~/.zsh/zsh-sdkman
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# jupyter install with ipython-sql support
pip3 install --upgrade pip
pip3 install jupyter
pip3 install ipython-sql
