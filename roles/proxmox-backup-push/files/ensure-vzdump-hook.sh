#!/usr/bin/env bash
set -euo pipefail

CRON_FILE="/etc/pve/vzdump.cron"
HOOK_LINE="hookscript: local:snippets/vzdump-uptime-kuma-hook.sh"

[[ -f "$CRON_FILE" ]] || exit 0

if ! grep -Fxq "$HOOK_LINE" "$CRON_FILE"; then
  echo "" >> "$CRON_FILE"
  echo "$HOOK_LINE" >> "$CRON_FILE"
  logger -t vzdump-hook-guard "Hookscript re-added to vzdump.cron"
fi
