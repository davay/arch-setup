#!/bin/bash

read -rsp "Sudo password: " PASS
echo
echo "$PASS" | sudo -S --prompt="" pacman -S --needed --noconfirm ansible
ansible-galaxy collection install -r requirements.yml
(
  export ANSIBLE_BECOME_PASS="$PASS"
  ansible-playbook ./playbooks/init.yml
)
