#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

function cp_dotfiles() {
    echo "Copying dotfiles to home folder......"
    rsync --exclude ".git/" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        -avh --no-perms . ~;
    source ~/.zshrc;
}

read -p "Copy all dotfiles to home folder? (y/n) " -n 1;
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cp_dotfiles;
fi;

unset cp_dotfiles;
