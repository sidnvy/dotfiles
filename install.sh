#!/bin/sh

if [ -z "$USER" ]; then
    USER=$(id -un)
fi

echo "=========================================================="
echo "* Install following packages:"
echo "----------------------------------------------------------"

cd $HOME

sudo apt-get install -y zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

sudo chsh -s /usr/bin/zsh $USER

# Install fzf
FZF_VERSION=0.30.0
curl -L https://github.com/junegunn/fzf/releases/download/${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tar.gz | tar xzC $HOME/bin

# Install ripgrep
sudo apt install -y ripgrep

# Install neovim
NVIM_VERSION=0.8.0
curl -L -o nvim.deb https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim-linux64.deb
sudo apt-get install -y ./nvim.deb

# Install nvchad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

mv $HOME/config/nvchad/custom $HOME/.config/nvim/lua

# Install tmux
sudo apt-get install -y tmux
