#!/usr/bin/env bash

echo "clone tap CHUNKWM and SKHD"
brew tap koekeishiya/formulae

echo "Installing Chunkwm"
brew install chunkwm

echo "Installing Skhd"
brew install koekeishiya/formulae/skhd

echo "Moving Configs"
mv "chunkwmrc" "~/.configs/"
mv "skhdrc" "~/.configs/"
mv "scripts/" "~/.configs/"


echo "Installing configs"
ln -s "${HOME}/.config/chunkwmrc" "${HOME}/.chunkwmrc"
ln -s "${HOME}/.config/skhdrc" "${HOME}/.skhdrc"

echo "Starting services CHUNKWM + SKHD"
brew services start chunkwm
brew services start skhd
