#!/bin/bash
apt-get install build-essential

sudo apt-get install libncurses-dev
sudo apt-get install clang-format-10

apt-get install zsh

apt-get install curl

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
