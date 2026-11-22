#!/usr/bin/env bash
# Save the publish-site login cookie from the clipboard into a private file, then test it.
# Copy the cookie value first (see SKILL.md), then run this script. The value is never printed.
set -euo pipefail
DIR="$HOME/.config/breadfast-publish"
mkdir -p "$DIR"; chmod 700 "$DIR"
VAL="$(pbpaste | tr -d '\r\n' | sed -E 's/^[[:space:]]*[Cc]ookie:[[:space:]]*//')"
[ -n "$VAL" ] || { echo "Clipboard is empty - copy the cookie value first."; exit 1; }
( umask 077; printf '%s' "$VAL" > "$DIR/cookie" )
echo "Saved to $DIR/cookie (only you can read it). Testing..."
if "$(dirname "$0")/deploy.sh" check; then
  echo "Login works."
else
  echo "That cookie didn't log in. Make sure you copied the whole 'cookie' request header from publish.apps.breadfast.com while signed in."
  exit 1
fi
