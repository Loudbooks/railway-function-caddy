#!/bin/bash
set -e
trap 'exit_status=$?' EXIT
exit_status=0

if [ -z "$1" ]; then
  echo "Usage: $0 <base64-encoded-caddyfile>"
  exit 1
fi

echo "$1" | base64 -d > /etc/caddy/Caddyfile || { echo "Failed to decode base64 caddyfile"; exit 1; }

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile || exit_status=$?

exit $exit_status
