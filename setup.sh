#!/bin/sh
cwd=$(pwd)
sudo apt update -y
# install C++ tool chain
sudo apt-get install -y ninja-build gettext libssl-dev libtool libtool-bin autoconf automake cmake g++ pkg-config unzip clangd-11

sudo apt-get install -y python3-pip

# install version control and file retrieval tools
sudo apt-get install -y curl file git wget ssh

# install xclip if not using wsl
# if ! grep -qi microsoft /proc/version; then
    sudo apt-get install -y xclip
# fi


# install neovim Nightly via appimage
sudo apt remove neovim -y
# curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
# chmod u+x nvim.appimage
# ./nvim.appimage --appimage-extract
# # Optional: exposing nvim globally
# sudo mv squashfs-root / && sudo ln -s /squashfs-root/usr/bin/nvim /usr/bin/nvim

# install neovim Nightly with tarball
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
sudo tar -xzvf nvim-linux64.tar.gz -C /opt
# create symbolic link to usr bin
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim

# llvm binary
# cd ~
# wget https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz
# tar -xvf clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz
# mv clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04 clang+llvm-11.0.0
# rm clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz
# cd cwd

#boost library
# cd ~
# wget https://dl.bintray.com/boostorg/release/1.74.0/source/boost_1_74_0.tar.bz2
# tar -xvjf boost_1_74_0.tar.bz2
# cd boost_1_74_0
# sudo ./bootstrap.sh --prefix=/usr --with-python=python3 && sudo ./b2 stage -j<N> threading=multi link=shared
# sudo ./b2 headers
# sudo ./b2 install threading=multi link=shared
# cd cwd

#zsh
sudo apt install zsh -y
chsh -s $(which zsh)

#zsh plugins
git clone https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# install lsd
wget https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb
sudo dpkg -i lsd_0.23.1_amd64.deb
rm lsd_0.23.1_amd64.deb

# copy zshrc
cp .zshrc ~
source ~/.zshrc

# install vim-plug for nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user neovim

# setup init.vim
mkdir ~/.config/nvim
cp nvim/init.vim ~/.config/nvim
v ~/.config/nvim/init.vim

# jupyter install with ipython-sql support
# sudo apt install python3-pip
# pip3 install --user notebook
# pip3 install --user ipython-sql
# sudo apt install python3-neovim

# generate ssh-key
ssh-keygen -t ed25519

# copy the ssh-key to clipboard
# if grep -qi microsoft /proc/version; then
#     cat ~/.ssh/id_ed25519.pub | clip
# else
    xclip -sel clip < ~/.ssh/id_ed25519.pub
# fi

