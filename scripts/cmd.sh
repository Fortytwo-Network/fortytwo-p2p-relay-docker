#!/bin/sh
set -e

RELAY_EXEC="${RELAY_EXEC:-/workspace/relay}"
echo "Check current version"
CURRENT_RELAY_VERSION_OUTPUT=$("$RELAY_EXEC" --version 2>/dev/null)
RELAY_VERSION=$(curl -s "https://fortytwo-network-public.s3.us-east-2.amazonaws.com/relay/latest")

if [[ "$CURRENT_RELAY_VERSION_OUTPUT" == *"$RELAY_VERSION"* ]]; then
        echo "Up to date"
    else
        echo "Updating..."
        ./install.sh
        echo "Successfully updated"
    fi

"$RELAY_EXEC"
