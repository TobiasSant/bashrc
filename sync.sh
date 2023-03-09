#!/bin/bash

echo -e "\e[35m\nedit bashrc\e[0m"
sudo sed -i -e '/# Tunning section/,$d' ~/.bashrc
sudo cat bashTunning.bashrc >> ~/.bashrc

echo -e "\e[35m\nsource ~/.bashrc\n\e[0m"
source ~/.bashrc