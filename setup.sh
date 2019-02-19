#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")"
CONFIG_LOCATION=`pwd`
echo $CONFIG_LOCATION

# Update git repository to the most up to date
update_git() {
    git pull origin master

    git_exit_code=$?
    if [[ $git_exit_code != 0 ]]; then
	exit $git_exit_code
    fi
}

# Clean git if we want
ask_clean_git() {
    git clean -nx
    read -p "Clean the above files? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
	git clean -fx
    fi
}

# Symlink .emacs.d directory to user home
link_emacs_d() {
    # Remove old symlink if it exists and replace.
    # We can't use ln -sfT ... because MacOS ln does not support it!
    rm -f "$HOME/.emacs.d"
    ln -s "$CONFIG_LOCATION/.emacs.d" "$HOME/.emacs.d"
}

# Prepare repository
update_git
ask_clean_git

# Clone and build C/C++/Obj-C language server if not present, otherwise update.
./setup_ccls.sh

# If -f option is provided, just get it over with
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    link_emacs_d
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        link_emacs_d
    fi
fi
