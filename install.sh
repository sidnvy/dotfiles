#!/bin/sh

echo "=========================================================="
echo "* Install following packages:"
echo "----------------------------------------------------------"

cd $HOME

sudo DEBIAN_FRONTEND=noninteractive apt update -yq

# Find all files in the runcoms directory that do not match README.md and create symbolic links to them in the home directory
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/*; do
  if [ "$(basename "$rcfile")" != "README.md" ]; then
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.$(basename "$rcfile")"
  fi
done

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

sudo chsh -s /usr/bin/zsh

# Install neovim
NVIM_VERSION=0.8.3
curl -L -o $HOME/nvim.deb https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim-linux64.deb
sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq $HOME/nvim.deb ripgrep tmux

# Install nvchad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

mv /workspaces/.codespaces/.persistedshare/dotfiles/nvchad/custom $HOME/.config/nvim/lua
mv /workspaces/.codespaces/.persistedshare/dotfiles/.tmux.conf $HOME
mv /workspaces/.codespaces/.persistedshare/dotfiles/.zpreztorc $HOME
