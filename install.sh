#!/bin/bash

cd "${0%/*}"

# Move and save existing configs
NOW=$(date "+%Y%m%d%H%M%S")

git submodule update --init

# backup all dotfiles under home
mv --backup=t ~/.bashrc ~/.bashrc."$NOW"
mv --backup=t ~/.zshrc ~/.zshrc."$NOW"
mv --backup=t ~/.vimrc ~/.vimrc."$NOW"
mv --backup=t ~/.utils ~/.utils."$NOW"
mv --backup=t ~/.aliases ~/.aliases."$NOW"
mv --backup=t ~/.tmux.conf ~/.tmux.conf."$NOW"
mv --backup=t ~/.gitconfig ~/.gitconfig."$NOW"
mv --backup=t ~/.pylintrc ~/.pylintrc."$NOW"
mv --backup=t ~/.oh-my-zsh ~/.oh-my-zsh."$NOW"
mv --backup=t ~/.oh-my-bash ~/.oh-my-bash."$NOW"

# Create symlinks to repository dotfiles
ln -s "${PWD}"/.bashrc ~/.bashrc
ln -s "${PWD}"/.zshrc ~/.zshrc
ln -s "${PWD}"/.vimrc ~/.vimrc
ln -s "${PWD}"/.utils ~/.utils
ln -s "${PWD}"/.aliases ~/.aliases
ln -s "${PWD}"/.tmux.conf ~/.tmux.conf
ln -s "${PWD}"/.gitconfig ~/.gitconfig
ln -s "${PWD}"/.pylintrc ~/.pylintrc
ln -s "${PWD}"/.oh-my-zsh ~/.oh-my-zsh
ln -s "${PWD}"/.oh-my-bash ~/.oh-my-bash
touch ~/.local

echo -e "installation completed"
