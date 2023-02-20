#!/usr/bin/env bash
set -e

os_type=$(uname)
echo "Current os is $os_type"

if [[ ! -x "$(which zsh)" ]]; then
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
    echo "zsh was installed!"
else
    echo "zsh has been installed, skipping.."
fi

if [[ -z ~/.oh-my-zsh/ ]]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "oh-my-zsh was installed!"
else
    echo "oh-my-zsh has been installed, skipping..."
fi


if [[ ! -x "$(which fzf)" ]]; then
    echo "Installing fzf"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
else
    echo "fzf has been installed, skipping..."
fi

# link all dotfiles
all_files=$(ls -al | awk -F " " '{print $9}' | grep -i "^\.[A-Za-z].*" | grep -vi "^.git$")
echo "soft links will be linked for files:"
echo $all_files

for f in $all_files
do
    echo "creating soft link for $f"
    ln -sf $(pwd)/$f ~/$f
done

if [[ $os_type == "Linux" ]]; then
    ln -sf $(pwd)/.fonts.conf ~/.fonts.conf
fi

echo -e "\n-------------------------------soft links created!-----------------------------"
for f in $all_files
do
    ls -al ~/$f
done

echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Done!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
