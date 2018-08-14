#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")"
CONFIG_LOCATION=`pwd`
echo $CONFIG_LOCATION

# Update .emacs.d to the most up to date
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

# Acquire cquery location
# param out $i: cquery directory
get_cquery_location() {
    
    # Check if we have saved cquery location, otherwise prompt for location
    if [[ -f "$CONFIG_LOCATION/cquery_location.txt" ]]; then
	cquery_location="$(tail -n 1 "$CONFIG_LOCATION/cquery_location.txt")"
    else
	echo "Required utility cquery not found.  Please specify location to clone and build."
	echo "Default: $(dirname "$CONFIG_LOCATION")/cquery"
	read cquery_location
	while [[ ! -d "$(dirname "$cquery_location")" ]]; do
	    echo "invalid location: $cquery_location"
	    echo "$(dirname "$cquery_location")"
	    read cquery_location
	done

	# Read a blank input as requesting the default
	if [[ -z "$cquery_location" ]]; then
	    cquery_location="$(dirname "$CONFIG_LOCATION")/cquery"
	fi

	# Save cquery location
	echo "$cquery_location" > "$CONFIG_LOCATION/cquery_location.txt"
    fi

    eval "$1="$cquery_location""
}

# Clone and build cquery if it isn't found
# param in $1: cquery directory
clone_build_cquery() {
    if [[ ! -d "$1" ]]; then
	echo "Cloning cquery"
	git clone https://github.com/cquery-project/cquery.git --recursive "$1"
    fi
    cd "$1"
    update_git
    mkdir -p build && cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release \
	     -DCMAKE_INSTALL_PREFIX=release \
	     -DCMAKE_EXPORT_COMPILE_COMMANDS=YES

    cmake --build .
    cmake --build . --target install
}

# Generate init-cquery-exec.el as it will have user dependent info
# param in $1: cquery directory
generate_user_cquery_el() {
    cquery_exec_location="$CONFIG_LOCATION/.emacs.d/lisp/init-cquery-exec.el"
    cat "$CONFIG_LOCATION/init-cquery-exec-template.el" > "$cquery_exec_location"
    echo "(setq cquery-executable \"$1/build/release/bin/cquery\")" >> "$cquery_exec_location"
    echo "(provide 'init-cquery-exec)" >> "$cquery_exec_location"
}

# Symlink .emacs.d directory to user home
link_emacs_d() {
    ln -s "$CONFIG_LOCATION/.emacs.d" "$HOME/.emacs.d"
}

# Prepare repository
update_git
ask_clean_git

# Clone and build if not present, otherwise update.
_cquery_location=''
get_cquery_location _cquery_location
clone_build_cquery "$_cquery_location"
generate_user_cquery_el "$_cquery_location"

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
