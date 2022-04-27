#!/usr/bin/env bash

echo "Set nvim config files"

echo "Installing vim plug"
#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Creating the nvim folder in config path"
mkdir "${HOME}/.config/nvim"

echo "Creating backup and swap folders"
mkdir "${HOME}/.backup/"
mkdir "${HOME}/.swap/"

echo "Instlling python provider"
python3 -m pip install --user --upgrade pynvim

echo "installing node nvim provider"
yarn global add neovim

echo "Linking init.vim"
ln -s "${HOME}/dotfiles/nvim/init.vim" "${HOME}/.config/nvim/"

echo "Linking coc-settings file"
ln -s "${HOME}/dotfiles/nvim/coc-settings.json/" "${HOME}/.config/nvim/"

echo "Linking general folder"
ln -s "${HOME}/dotfiles/nvim/general/" "${HOME}/.config/nvim/"

echo "Linking plugins folder"
ln -s "${HOME}/dotfiles/nvim/plugins/" "${HOME}/.config/nvim/"

echo "Linking snippets folder"
ln -s "${HOME}/dotfiles/nvim/snippets/" "${HOME}/.config/nvim/"

echo "Linking notes folder"
ln -s "${HOME}/dotfiles/nvim/notes/" "${HOME}/.config/nvim/"
