# `ghpf.sh`

This is a simple bash script that creates a private fork of your desired github repository on your github account. It disables the upstream pushes and clones the newly privately forked repo to your current working directory.

The script assumes that:

1. You have a GitHub account.
2. You have the `gh` CLI utility installed on your machine.
3. You are logged into your GitHub account via the `gh` utility.
4. You have enough disk space.
