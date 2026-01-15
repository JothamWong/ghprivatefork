#!/bin/bash

# Get the absolute path of the script
INSTALL_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SCRIPT_SRC="$INSTALL_DIR/ghpf.sh"

if [[ "$SHELL" == */zsh ]]; then
    RC_FILE="$HOME/.zshrc"
elif [[ "$SHELL" == */bash ]]; then
    RC_FILE="$HOME/.bashrc"
else
    RC_FILE="$HOME/.profile"
fi

LINE_TO_ADD="source $SCRIPT_SRC"

if ! grep -Fxq "$LINE_TO_ADD" "$RC_FILE"; then
    echo "Adding $LINE_TO_ADD to $RC_FILE"
    echo -e "\n$LINE_TO_ADD" >> "$RC_FILE"
    echo "Restart shell: source $RC_FILE"
else
    echo "ghpf is already configured in $RC_FILE"
fi