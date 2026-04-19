#!/bin/bash

read -rsp "Sudo password: " PASS
sudo pacman -S --needed --noconfirm ansible
echo
(
    export ANSIBLE_BECOME_PASS="$PASS"
    ansible-playbook ./playbooks/init.yml
)
