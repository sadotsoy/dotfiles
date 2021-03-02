#!/usr/bin/env bash

echo "Set nvim config files"

echo "Installing vim plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Creating the nvim folder in config path"
mkdir "~/.config/nvim/"

echo "Creating backup and swap folders"
mkdir "~/.backup/"
mkdir "~/.swap/"

echo "Linking init.vim"
ln -s "./init.vim" "~/.config/nvim/"

echo "Linking coc-settings file"
ln -s "./coc-settings.json/" "~/.config/nvim/"

echo "Linking general folder"
ln -s "./general/" "~/.config/nvim/"

echo "Linking plugins folder"
ln -s "./plugins/" "~/.config/nvim/"

echo "Linking snippets folder"
ln -s "./snippets/" "~/.config/nvim/"

