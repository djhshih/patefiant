#!/bin/bash
set -e

# Script for installing ropen

name="pm2bib"
version="0.1"
target_dir=$PATEFIANT_ROOT

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# install rip
curl -L https://github.com/djhshih/${name}/archive/v${version}.tar.gz |
	tar -xz --strip-components=1 'pm2bib-*/pm2bib.py'
install pm2bib.py $target_dir/bin/pm2bib && rm pm2bib.py

