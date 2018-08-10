#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")"
CONFIG_LOCATION=`pwd`
echo $CONFIG_LOCATION
git pull origin master

git_exit_code=$?
if [[ $git_exit_code != 0 ]]; then
    exit $git_exit_code
fi

function clean() {
    git clean -nx
    read -p "Clean the above files? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
	git clean -fx
    fi
}

function link_files() {
    for i in $(ls -a); do
	if [ $i != '.' -a $i != '..' -a $i != '.git' -a $i != '.DS_Store' -a $i != `basename "$0"` -a $i != "README.md" -a $i != '.gitignore' -a $i != '.gitmodules' ]; then
	    echo "$i"
	    ln -s "$CONFIG_LOCATION/$i" "$HOME/$i"
	fi
    done
}

clean
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    link_files
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
	link_files
    fi
fi
