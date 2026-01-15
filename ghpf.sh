#!/bin/bash

ghpf() {
    if [ -z "$1" ]; then
        echo "Usage: $0 <repository_url> [destination_name]"
        return 1
    fi
    
    local ORIGINAL_REPO=$1
    local REPO_NAME=$(basename "$ORIGINAL_REPO" .git)

    if [ -n "$2" ]; then
        REPO_NAME=$2
    fi

    if ! command -v gh &> /dev/null; then
        echo "Install gh cli"
        return 1
    fi

    if ! gh auth status &> /dev/null; then
        echo "gh auth login"
        return 1
    fi

    local USERNAME=$(gh api user -q .login)
    local MY_REPO="git@github.com:${USERNAME}/${REPO_NAME}.git"

    echo "Creating private fork of repo"
    echo "Source: $ORIGINAL_REPO"
    echo "Destination: $REPO_NAME"
    echo "Owner: $USERNAME"

    git clone --bare $ORIGINAL_REPO
    gh repo create "$REPO_NAME" --private
    cd "${REPO_NAME}.git"
    git push --mirror "$MY_REPO"
    cd ..
    rm -rf "${REPO_NAME}.git"
    git clone "$MY_REPO"
    cd "$REPO_NAME"
    git remote add upstream $ORIGINAL_REPO
    git remote set-url --push upstream DISABLE
    echo "Done. Showing remotes:"
    git remote -v 
}
