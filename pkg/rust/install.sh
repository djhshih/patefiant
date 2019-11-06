#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

name=rust
version=latest
target_dir=$PATEFIANT_ROOT/opt/rust

# pre-emptively create rust directories and establish symlinks at 
# standard rust locations
dirs=( .cargo .rustup .multirust )
for f in ${dirs[@]}; do
	dir=$target_dir/$f
	mkdir -p $dir
	ln -sf $dir $HOME/$f
done

# Download and install rust interactively

curl https://sh.rustup.rs -sSf | sh
