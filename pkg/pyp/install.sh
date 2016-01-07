#!/bin/bash
set -e

# Script for installing pyp (Python Power at the Prompt)

# Prerequisites: - gcc
#                - wget

name="pyp"
version="2.13-beta"
target_dir=$PATEFIANT_ROOT
package=$name-$version

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O $package.tar.gz "https://github.com/djhshih/pyp/archive/v${version}.tar.gz"
mkdir $package
tar -xzf $package.tar.gz -C $package --strip-components=1
cd $package

# install package

make install DESTDIR=$target_dir

