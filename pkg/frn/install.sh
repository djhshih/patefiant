#!/bin/bash
set -e

# Script for installing R package installer rip

name="frn"
version="0.2"
target_dir=$PATEFIANT_ROOT

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# install static binary
curl -L https://github.com/djhshih/frn/releases/download/v${version}/frn-${version}.tar.bz2 |
	tar --strip-components=1 -xj
install $name $target_dir/bin

