#!/bin/bash

read -rsp "Sudo password: " PASS
echo "$PASS" | sudo -S pacman -S --needed --noconfirm ansible
echo
(
  export ANSIBLE_BECOME_PASS="$PASS"
  ansible-playbook ./playbooks/init.yml
)
