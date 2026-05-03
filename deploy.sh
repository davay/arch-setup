#!/bin/bash

read -rsp "Sudo password: " PASS
echo
(
  export ANSIBLE_BECOME_PASS="$PASS"
  ansible-playbook ./playbooks/containers.yml
  ansible-playbook ./playbooks/ssh.yml
  ansible-playbook ./playbooks/route53-ddns.yml
  ansible-playbook ./playbooks/caddy.yml
)
