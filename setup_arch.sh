#!/bin/sh
cwd=$(pwd)
sudo pacman -Syu
# install C++ tool chain
sudo pacman -S ninja-build gettext libssl-dev libtool libtool-bin autoconf automake cmake\
g++ pkg-config unzip clangd-12

sudo pacman -S python3-pip

# install file retrieval tools
sudo pacman -S curl wget ssh
sudo pacman -S xclip

# get yay
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R art:art ./yay-git
cd yay-git
makepkg -si

# swap primary monitor and dual monitor positions
# comment out if not needed
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "xrandr --output DVI-D-0 --mode 1680x1050 --pos 1920x15 --rotate normal --output HDMI-0 --off\
--output DP-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off" >> ~/.xinitrc

# and setup awesome wm theme
yay -Syu
yay -S awesome rofi picom i3lock-fancy xclip ttf-roboto polkit-gnome materia-theme lxappearance\
flameshot pnmixer network-manager-applet xfce4-power-manager qt5-styleplugins\
capitaine-cursors papirus-icon-theme qt5-styleplugins -y
git clone git@github.com:ChrisTitusTech/titus-awesome.git ~/.config/awesome
# follow the rest of the setup on https://github.com/ChrisTitusTech/titus-awesome
# set rofi theme
mkdir -p ~/.config/rofi
cp $HOME/.config/awesome/theme/config.rasi ~/.config/rofi/config.rasi
sed -i '/@import/c\@import "'$HOME'/.config/awesome/theme/sidebar.rasi"' ~/.config/rofi/config.rasi
#set application theme and fix missing indicators
sudo bash -c "echo -e 'XDG_CURRENT_DESKTOP=Unity\nQT_QPA_PLATFORMTHEME=gtk2' >> /etc/environment"


# Various misc apps, chinese&japanese&korean language support
sudo pacman -S discord noto-fonts-cjk ibus ibus-libpinyin ibus-anthy
yay -S brave-bin logiops

#zsh
sudo pacman -S zsh -y
chsh -s $(which zsh)

#zsh plugins
git clone https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh/zsh-completions.git

# install lsd for ls with nerd font icons
sudo pacman -S lsd

# copy zshrc
cp .zshrc ~
source ~/.zshrc

# install nerd font and set it
sudo pacman -S ttf-firacode-nerd

# install neovim and packer
sudo pacman -S neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# ripgrep to use plugin features
sudo pacman -S ripgrep

# setup nvim config
git clone git@github.com:ThePrimeagen/init.lua.git ~/.config/nvim
