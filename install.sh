#!/bin/bash

cd "${0%/*}"

# Move and save existing configs
NOW=$(date "+%Y%m%d%H%M%S")

git submodule update --init
git submodule update --remote

files=(".bashrc" ".zshrc" ".vimrc" ".utils" ".aliases" ".tmux.conf" ".gitconfig" ".pylintrc") 
dirs=(".oh-my-zsh" ".oh-my-bash")

# backup and link all dotfiles under home
for file in "${files[@]}"
do
    mv --backup=t ~/"${file}" ~/"${file}.${NOW}"
    ln -s "${PWD}"/"${file}" ~/"${file}"
done

for dir in "${dirs[@]}"
do
    mv --backup=t ~/"${dir}" ~/"${dir}.${NOW}"
    ln -s "${PWD}"/"${dir}" ~/"${dir}"
done
touch ~/.local

echo -e "installation completed"
