#!/usr/bin/env bash
echo -e "starting install dotfiles"

cd "${0%/*}"

# Move and save existing configs
NOW=$(date "+%Y%m%d%H%M%S")

git submodule update --init
git submodule update --remote

files=(".bashrc" ".zshrc" ".vimrc" ".userconfig" ".aliases" ".tmux.conf" ".gitconfig" ".pylintrc") 
dirs=(".oh-my-zsh" ".oh-my-bash")

# backup and link all dotfiles under home
for file in "${files[@]}"
do
    mv ~/"${file}" ~/"${file}.${NOW}"
    ln -s "${PWD}"/../dotfiles/"${file}" ~/"${file}"
done

for dir in "${dirs[@]}"
do
    mv ~/"${dir}" ~/"${dir}.${NOW}"
    ln -s "${PWD}"/../"${dir}" ~/"${dir}"
done
touch ~/.local

echo -e "installation completed"
echo -e "You may create '.gituser-default' and '.gituser-work' under your home directory"