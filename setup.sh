#!/bin/bash

sudo pacman -S --needed --noconfirm base-devel git
git clone https://aur.archlinux.org/paru.git /tmp/paru
cd /tmp/paru && makepg -si --noconfirm

sudo pacman -S less github-cli ghostty neovim docker zsh ansible

chsh -s /bin/zsh

paru -S 1password zen-browser-bin oh-my-zsh-git

yes | /usr/share/oh-my-zsh/tools/install.sh
