#!/bin/bash
set -e

# Script for installing R package installer rip

name="rip"
version="0.3"
target_dir=$PATEFIANT_ROOT

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# install rip
curl -L https://github.com/djhshih/rip/archive/v${version}.tar.gz |
	tar -xz --strip-components=1 'rip-*/rip'
install rip $target_dir/bin

