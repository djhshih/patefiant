#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

version=latest

# pre-emptively create rust directories and establish symlinks at 
# standard rust locations
dirs=( .cargo .rustup .multirust )
for f in ${dirs[@]}; do
	dir=$PATEFIANT_ROOT/rust/$f
	mkdir -p $dir
	ln -s $dir $HOME/$f
done

# Download and install rust interactively

curl https://sh.rustup.rs -sSf | sh
