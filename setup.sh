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

# Acquire language server location
# param in $1: language server name
# param out $2: language server directory
get_language_server_location() {
    
    # Check if we have saved language server location, otherwise prompt for location
    if [[ -f "$CONFIG_LOCATION/language_server_location.txt" ]]; then
	language_server_location="$(tail -n 1 "$CONFIG_LOCATION/language_server_location.txt")"
    else
	echo "Required language server utility not found.  Please specify location to clone and build."
	echo "Default: $(dirname "$CONFIG_LOCATION")/$1"
	read language_server_location
	while [[ ! -d "$(dirname "$language_server_location")" ]]; do
	    echo "invalid location: $language_server_location"
	    echo "$(dirname "$language_server_location")"
	    read language_server_location
	done

	# Read a blank input as requesting the default
	if [[ -z "$language_server_location" ]]; then
	    language_server_location="$(dirname "$CONFIG_LOCATION")/$1"
	fi

	# Save language server location
	echo "$language_server_location" > "$CONFIG_LOCATION/language_server_location.txt"
    fi

    eval "$2="$language_server_location""
}

# Clone and build language server if it isn't found
# param in $1: language server directory
clone_build_language_server() {
    if [[ ! -d "$1" ]]; then
	echo "Cloning language server"
	git clone https://github.com/MaskRay/ccls --recursive --depth=1 "$1"
    fi
    cd "$1"
    update_git
#    mkdir -p build && cd build
#    cmake .. -DCMAKE_BUILD_TYPE=Release \
#	     -DCMAKE_INSTALL_PREFIX=release \
#	     -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
    cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_PREFIX_PATH=/usr/lib/llvm-7 \
	  -DLLVM_INCLUDE_DIR=/usr/lib/llvm-7/include \
	  -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-7/ \
	  -DLLVM_ENABLE_RTTI=on

    cmake --build Release
    
#    cmake --build .
#    cmake --build . --target install
}

# Generate init-ccls-exec.el as it will have user dependent info
# param in $1: language server directory
generate_user_language_server_el() {
    language_server_exec_location="$CONFIG_LOCATION/.emacs.d/lisp/init-ccls-exec.el"
    cat "$CONFIG_LOCATION/init-ccls-exec-template.el" > "$language_server_exec_location"
    echo "(setq ccls-executable \"$1/Release/ccls\")" >> "$language_server_exec_location"
    echo "(provide 'init-ccls-exec)" >> "$language_server_exec_location"
}

# Symlink .emacs.d directory to user home
link_emacs_d() {
    ln -s "$CONFIG_LOCATION/.emacs.d" "$HOME/.emacs.d"
}

# Prepare repository
update_git
ask_clean_git

# Clone and build if not present, otherwise update.
_language_server_location=''
get_language_server_location "ccls" _language_server_location
clone_build_language_server "$_language_server_location"
generate_user_language_server_el "$_language_server_location"

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
