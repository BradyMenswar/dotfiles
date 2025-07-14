#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e
# Simple cross-platform version
kitty_patterns=("kitty" "kitty$" "kitty\.app.*kitty$")

for pattern in "${kitty_patterns[@]}"; do
    if pgrep -f "$pattern" > /dev/null 2>&1; then
        echo "Reloading Kitty..."
        pkill -USR1 -f "$pattern"
        exit 0
    fi
done

echo "Kitty not found running"
