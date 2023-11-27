#!/bin/bash
# Common functions

set -euo pipefail
IFS=$'\n\t'

# initialize environment
_init() {
	local_dir=$(dirname "$(readlink -f "$0")")
	# create and enter temporary directory
	tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir
}

# define variable to value in file
_def_var() {
	name=$1
	value=$2
	file=$3
	sed "s|$name=.*|$name=$value|" $file
}

# set variable to value in file
_set_var() {
	name=$1
	value=$2
	file=$3
	sed "s|\$$name|$value|g" $file
}

