#!/bin/bash

if [ "$1" == "bashrc" ]; then
    TARGET_RC="$HOME/.bashrc"
    TUNNING_RC="bashTunning.bashrc"
elif [ "$1" == "zshrc" ]; then
    TARGET_RC="$HOME/.zshrc"
    TUNNING_RC="zshTunning.zshrc"
else
    echo "Usage: $0 [bashrc|zshrc]"
    exit 1
fi

echo -e "\e[35m\nAdd alias to $1\e[0m"
sudo sed -i -e '/# Alias section/,$d' "$TUNNING_RC"
sudo cat alias.bashrc >> "$TUNNING_RC"

echo -e "\e[35m\nEdit $1\e[0m"
# sudo sed -i -e '/# Tunning section/,$d' "$TARGET_RC"
sudo sed -i -e '/# Tunning section/,/# FIN_COCO_LOCO/d' "$TARGET_RC"
sudo cat "$TUNNING_RC" >> "$TARGET_RC"

echo -e "\e[35m\nSource $TARGET_RC\n\e[0m"
source "$TARGET_RC"