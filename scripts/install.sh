#!/bin/sh
set -e

RELAY_EXEC="${RELAY_EXEC:-/workspace/relay}"

RELAY_VERSION=$(curl -s "https://download.swarminference.io/relay/latest")

DOWNLOAD_RELAY_URL="https://download.swarminference.io/relay/v$RELAY_VERSION/FortytwoProtocolRelay-linux-amd64"

curl -fsSL -o "$RELAY_EXEC" "$DOWNLOAD_RELAY_URL"

chmod +x "$RELAY_EXEC"
