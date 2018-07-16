#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")"
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

function copy_files() {
    for i in $(ls -a); do
	if [ $i != '.' -a $i != '..' -a $i != '.git' -a $i != '.DS_Store' -a $i != `basename "$0"` -a $i != "README.md" -a $i != '.gitignore' -a $i != '.gitmodules' ]; then 
	    echo "$i"
	    cp -alrf "$i" "$HOME/"
	fi
    done
}

clean
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    copy_files
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
	copy_files
    fi
fi
