#!/bin/bash
set -e

# Script for installing ropen

name="ropen"
version="0.2"
target_dir=$PATEFIANT_ROOT

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# install rip
curl -L https://github.com/djhshih/ropen/archive/v${version}.tar.gz |
	tar --strip-components=1 -xz
install ropen $target_dir/bin && rm ropen

