#!/bin/bash

echo -e "\e[35m\nInstall openssh-server \e[0m"
sudo apt-get install openssh-server

echo -e "\e[35m\nEnable ssh \e[0m"
sudo systemctl enable ssh

echo -e "\e[35m\nex: /home/user/.ssh/git \e[0m"
ssh-keygen -t ecdsa 

echo -e "\e[35m\nPaste in git.com \e[33m"
cat ~/.ssh/git.pub

echo -e "\e[35m\nssh-agent \e[0m"
eval `ssh-agent` 

echo -e "\e[35m\nAdds agent identity \e[0m"
ssh-add ~/.ssh/git