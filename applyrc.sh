#!/bin/bash

if [ "$1" == "bashrc" ]; then
    TARGET_SHELL="/bin/bash"
elif [ "$1" == "zshrc" ]; then
    TARGET_SHELL="/bin/zsh"
    # Verificar si Zsh está instalado
    if ! command -v zsh &> /dev/null; then
        echo "Zsh is not installed. Installing..."
        sudo apt-get install zsh
    else
        echo "Zsh is already installed."
    fi
else
    echo "Usage: $0 [bashrc|zshrc]"
    exit 1
fi

chsh -s "$TARGET_SHELL"