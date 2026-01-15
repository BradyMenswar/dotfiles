#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Kitty Terminal ---
# Send SIGUSR1 to all kitty processes to reload the config.
# The 'pgrep' check prevents errors if Kitty isn't running.
if pgrep -x "kitty" > /dev/null; then
    pkill -USR1 kitty
fi

