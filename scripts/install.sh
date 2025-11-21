#!/bin/sh
set -e

RELAY_EXEC="${RELAY_EXEC:-/workspace/relay}"

RELAY_VERSION=$(curl -s "https://fortytwo-network-packages-public.s3.us-east-2.amazonaws.com/relay/latest")

DOWNLOAD_RELAY_URL="https://fortytwo-network-packages-public.s3.us-east-2.amazonaws.com/relay/v$RELAY_VERSION/FortytwoProtocolRelay-linux-amd64"

curl -fsSL -o "$RELAY_EXEC" "$DOWNLOAD_RELAY_URL"

chmod +x "$RELAY_EXEC"
