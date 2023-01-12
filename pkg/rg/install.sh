#!/bin/bash
set -e

# Script for installing R package installer rip

name="ripgrep"
version="13.0.0"
arch="x86_64-unknown-linux-musl"
target_dir=$PATEFIANT_ROOT

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# install static binary
curl -L https://github.com/BurntSushi/ripgrep/releases/download/${version}/ripgrep-${version}-${arch}.tar.gz |
	tar --strip-components=1 -xz
install rg $target_dir/bin

