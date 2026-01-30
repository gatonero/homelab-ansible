# Base Role

This role establishes a minimal, secure, and reproducible baseline for all servers.

## What this role does

- Installs common base packages
- Defines system locale (server-neutral)
- Ensures reliable NTP via systemd-timesyncd
- Enables qemu-guest-agent on virtual machines
- Applies minimal SSH hardening
- Manages root SSH authorized_keys declaratively

## What this role does NOT do

- No application setup
- No firewall rules
- No monitoring agents
- No user management beyond root SSH keys

## Intended usage

This role is meant to be applied to **all hosts** as the first role in the stack.
