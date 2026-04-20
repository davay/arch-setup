## Description

Manual steps after setup.sh:
- login to 1password, go to settings > developer > integrate with 1password cli (needed for duck dns and other tokens)
- to setup GSConnect, open the extensions app. If it's stuck on "Waiting for service", run `systemctl reload --user dbus-broker.service`

Remember to setup port forwarding (TCP only) on the router:
- SSH: 22 -> 22
- HTTP: 80 -> 80
- HTTPS: 443 -> 443

SSH password auth has been disabled, use SSH keys.

TODO: include directions for archinstall here too -- this assumes nvidia stuff is already installed, and we have gnome etc
