#!/bin/sh

# Retirement guard: stop before downloads or changes to the host.
printf '%s\n' "Fortytwo's Hitchhiking to AGI program has concluded and Fortytwo nodes are not running. Please do not install or run this software. News: https://x.com/fortytwo" >&2
exit 1

set -e

RELAY_EXEC="${RELAY_EXEC:-/workspace/relay}"

RELAY_VERSION=$(curl -s "https://download.swarminference.io/relay/latest")

DOWNLOAD_RELAY_URL="https://download.swarminference.io/relay/v$RELAY_VERSION/FortytwoProtocolRelay-linux-amd64"

curl -fsSL -o "$RELAY_EXEC" "$DOWNLOAD_RELAY_URL"

chmod +x "$RELAY_EXEC"
