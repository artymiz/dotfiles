#!/bin/sh
cwd=$(pwd)
sudo pacman -Syu
# install C++ tool chain
sudo pacman -S ninja-build gettext libssl-dev libtool libtool-bin autoconf automake cmake g++ pkg-config unzip clangd-12

sudo pacman -S python3-pip

# install file retrieval tools
sudo pacman -S curl wget ssh
sudo pacman -S xclip

# For logitech custom button mappings
pacman -S logiops

# get yay and setup awesome wm theme
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R art:art ./yay-git
cd yay-git
makepkg -si
sudo yay -Syu
yay -S awesome rofi picom i3lock-fancy xclip ttf-roboto polkit-gnome materia-theme lxappearance flameshot pnmixer network-manager-applet xfce4-power-manager qt5-styleplugins papirus-icon-theme -y
git clone git@github.com:ChrisTitusTech/titus-awesome.git ~/.config/awesome
# follow the rest of the setup on https://github.com/ChrisTitusTech/titus-awesome

#zsh
sudo pacman -S zsh -y
chsh -s $(which zsh)

#zsh plugins
git clone https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# install lsd for ls with nerd font icons
pacman -S lsd

# copy zshrc
cp .zshrc ~
source ~/.zshrc

# install nerd font and set it
pacman -S ttf-firacode-nerd
setfont ttf-firacode-nerd

# install neovim and packer
sudo pacman -S neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# ripgrep to use plugin features
sudo pacman -S ripgrep

# setup nvim config
git clone git@github.com:ThePrimeagen/init.lua.git ~/.config/nvim
