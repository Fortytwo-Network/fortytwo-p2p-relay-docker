#!/bin/sh
set -e

RELAY_EXEC="${RELAY_EXEC:-/workspace/relay}"

echo "Check current version"
CURRENT_RELAY_VERSION_OUTPUT=$("$RELAY_EXEC" --version 2>/dev/null)

RELAY_VERSION=$(curl -s "https://fortytwo-network-public.s3.us-east-2.amazonaws.com/relay/latest")
echo "Latest version is v$RELAY_VERSION"

case "$CURRENT_RELAY_VERSION_OUTPUT" in
  *"$RELAY_VERSION"*)
    echo "Up to date"
    ;;
  *)
    echo "Updating..."
    ./install.sh
    echo "Successfully updated"
    ;;
esac

"$RELAY_EXEC"
