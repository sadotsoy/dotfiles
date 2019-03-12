#!/usr/bin/env bash

# Install plugin manager and set the vimrc
echo "Installing Vundle Vim."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
clear
echo "Moving virmc to HOME"
mv -f vimrc ~/.vimrc

