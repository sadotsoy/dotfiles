#!/usr/bin/env bash

# Set my own config.fish
# echo "Moving config.fish"
# ln config.fish /Users/sadotsoy/.config/fish


# Install fish shell and fisher plugin manager
echo "Installing fish, fisher and setted to default shell"
brew install fish

/bin/bash -c "$(curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher)"

# Install fish plugins and themes
echo "Moving config.fish to config path"
ln -s "${HOME}/dotfiles/fish/config.fish" "${HOME}/.config/fish/"

echo "Installing fish plugins and theme"
fisher install fisherman/getopts
fisher install fisherman/git_util
fisher install fisherman/gitignore
fisher install franciscolourenco/done
fisher install jethrokuan/z
fisher install jorgebucaran/fisher
fisher install jorgebucaran/hydro
fisher install oh-my-fishoxfish
fisher install pure-fish/pure
