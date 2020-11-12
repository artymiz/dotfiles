#!/bin/sh
sudo apt update
sudo apt install git
sudo apt install build-essential cmake
sudo apt-get install libncurses5-dev libncursesw5-dev
sudo apt-get install build-essential curl file git

# install homebrew
if ! command -v brew &> /dev/null
    bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    test -r ~/.bash_profile && echo eval" ($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
    echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
fi

# neovim stuff (nightly)
brew install --HEAD neovim
# vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# config file
mkdir ~/.config/nvim
cp ./nvim/init.vim ~/.config/nvim


sudo apt install zsh
chsh -s $(which zsh)

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
sudo apt install python3-neovim

