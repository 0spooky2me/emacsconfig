#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")"
CONFIG_LOCATION=`pwd`

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
    git pull origin master
    
    local cmake_flags="-H. -BRelease"
    if [[ "$OSTYPE" = "darwin"* ]]; then
	cmake_flags="$cmake_flags \
                     -DCMAKE_PREFIX_PATH=/usr/local/opt/llvm/"
    elif [[ "$OSTYPE" = "linux-gnu" ]]; then
	cmake_flags="$cmake_flags \
                     -DCMAKE_PREFIX_PATH=/usr/lib/llvm-7/ \
                     -DLLVM_INCLUDE_DIR=/usr/lib/llvm-7/include/ \
                     -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-7/ \
                     -DLLVM_ENABLE_RTTI=on"
    else
	echo "Error! I don't know the cmake flags for this OS"
	exit 1
    fi
    cmake $cmake_flags
    cmake --build Release
}

# Generate init-ccls-exec.el as it will have user dependent info
# param in $1: language server directory
generate_user_language_server_el() {
    language_server_exec_location="$CONFIG_LOCATION/.emacs.d/lisp/backend-packages/init-ccls-exec.el"
    cat "$CONFIG_LOCATION/init-ccls-exec-template.el" > "$language_server_exec_location"
    echo "(setq ccls-executable \"$1/Release/ccls\")" >> "$language_server_exec_location"
    echo "(provide 'init-ccls-exec)" >> "$language_server_exec_location"
}

_language_server_location=''
get_language_server_location "ccls" _language_server_location
clone_build_language_server "$_language_server_location"
generate_user_language_server_el "$_language_server_location"
