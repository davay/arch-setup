#!/bin/bash

read -rsp "Sudo password: " PASS
echo
(
  export ANSIBLE_BECOME_PASS="$PASS"
  ansible-playbook ./playbooks/containers.yml
)
