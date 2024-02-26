#!/bin/bash

if [ "$1" == "bashrc" ]; then
    TARGET_SHELL="/bin/bash"
elif [ "$1" == "zshrc" ]; then
    TARGET_SHELL="/bin/zsh"
    # Verificar si Zsh está instalado
    if ! command -v zsh &> /dev/null; then
        echo "Zsh is not installed. Installing..."
        sudo apt-get install zsh
        echo "Installing git repositories for Zsh plugins"
        git clone https://github.com/mafredri/zsh-async ~/.zsh/zsh-async
        git clone https://github.com/allanjamesvestal/fast-zsh-nvm ~/.zsh/fast-zsh-nvm
        git clone https://github.com/zap-zsh/supercharge ~/.zsh/supercharge
        git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
    else
        echo "Zsh is already installed."
    fi
else
    echo "Usage: $0 [bashrc|zshrc]"
    exit 1
fi

chsh -s "$TARGET_SHELL"