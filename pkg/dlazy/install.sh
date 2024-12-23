#!/bin/bash
set -e

# Script for installing R package installer rip

name="dlazy"
version="0.3"
target_dir=$PATEFIANT_ROOT

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

git clone --depth=1 https://github.com/djhshih/dlazy
cd dlazy
make install DESTDIR=$target_dir

