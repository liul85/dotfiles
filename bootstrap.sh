#!/usr/bin/env bash
set -e

echo "Installing ohmyzsh"
sudo dnf -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# link all dotfiles
all_files=$(ls -al | awk -F " " '{print $9}' | grep -i "^\.[A-Za-z].*" | grep -vi "^.git$")
echo $all_files

for f in $all_files
do
    echo "creating link for $f"
    ln -s $(pwd)/$f ~/$f
done

for f in $all_files
do
    ls -al /home/$USER/$f
done

echo "done!"

