#!/usr/bin/env bash
set -e

os_type=$(uname)
echo "Current os is $os_type"

echo "Installing zsh..." 
case $os_type in
    Linux)
        sudo dnf -y install zsh
        ;;
    Darwin)
        brew install zsh
        ;;
    *)
        echo "Unsupported os type: $os_type"
        echo "zsh was not installed."
        exit 1
esac

echo "Installing oh-my-zsh..."
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
    ln -sf $(pwd)/$f ~/$f
done

if [[ $os_type == "Linux" ]]; then
    ln -sf $(pwd)/.fonts.conf ~/.fonts.conf
fi

for f in $all_files
do
    ls -al ~/$f
done

echo "done!"

