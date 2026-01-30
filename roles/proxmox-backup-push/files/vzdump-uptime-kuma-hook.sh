#!/usr/bin/env bash
set -euo pipefail

PHASE="$1"
STATUS="${2:-}"

KUMA_IP="192.168.1.32"
KUMA_PORT="3001"
KUMA_TOKEN="M5VlFHAxh5PiNvowkYlNifgFExRDx3fr"

# Nur bei FEHLER pushen
if [[ "$STATUS" != "ok" ]]; then
  RESULT="down"
  MSG="vzdump FAILED on $(hostname -s)"

  curl -fsS \
    "http://${KUMA_IP}:${KUMA_PORT}/api/push/${KUMA_TOKEN}?status=${RESULT}&msg=$(printf '%s' "$MSG" | sed 's/ /%20/g')" \
    || true
fi

exit 0
