#!/bin/bash
set -e

# Script for installing R package installer rip

name="fd"
version="8.6.0"
arch="x86_64-unknown-linux-musl"
target_dir=$PATEFIANT_ROOT

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# install static binary
curl -L https://github.com/sharkdp/fd/releases/download/v${version}/fd-v${version}-${arch}.tar.gz |
	tar --strip-components=1 -xz
install $name $target_dir/bin

