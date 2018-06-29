#!/bin/bash
set -e

# Script for installing ropen

name="gbget"
version="0.1"
target_dir=$PATEFIANT_ROOT

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# install
curl -L https://github.com/djhshih/${name}/archive/v${version}.tar.gz |
	tar -xz --strip-components=1 --wildcards 'gbget-*/gbget.py'
install gbget.py $target_dir/bin/gbget && rm gbget.py

