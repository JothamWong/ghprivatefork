# `ghpf.sh`

This adds a simple bash function that creates a private fork of your desired github repository on your github account. 
It disables the upstream pushes and clones the newly privately forked repo to your current working directory.

The script assumes that:

1. You have a GitHub account.
2. You have the `gh` CLI utility installed on your machine.
3. You are logged into your GitHub account via the `gh` utility.
4. You have enough disk space.

## Instructions

After cloning the repository, run `./install.sh`. This script adds the `ghpf` function to either your `.bashrc` or `.zshrc`
file. Source the file to use the function.

## Usage

Run `ghpf <repository_url> [destination_name]`.

The script essentially does nothing if you already have a private fork of the existing repository.

## Acknowledgements

https://gist.github.com/0xjac/85097472043b697ab57ba1b1c7530274