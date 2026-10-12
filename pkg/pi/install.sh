#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

name=pi
version=latest
#target_dir=$PATEFIANT_ROOT/opt/${name}

# pre-emptively create rust directories and establish symlinks at 
# standard rust locations
# dirs=( .cargo .rustup .multirust )
# for f in ${dirs[@]}; do
# 	dir=$target_dir/$f
# 	mkdir -p $dir
# 	ln -sf $dir $HOME/$f
# done

curl -fsSL https://pi.dev/install.sh | sh
