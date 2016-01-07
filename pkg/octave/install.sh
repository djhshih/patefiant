#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

name="octave"
version="4.0.0"
target_dir=$PATEFIANT_ROOT
package=$name-$version

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O $package.tar.gz ftp://ftp.gnu.org/gnu/octave/$package.tar.gz
mkdir $package
tar -xzf $package.tar.gz -C $package --strip-components=1
cd $package

# extract files, configure, and compile

./configure --prefix=$target_dir
make
make install

