#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget


name="r"
version="devel"
target_dir=$PATEFIANT_ROOT
package=$name-$version

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O $package.tar.xz https://stat.ethz.ch/R/daily/R-${version}.tar.xz
mkdir $package
tar -xf $package.tar.xz -C $package --strip-components=1
cd $package

# extract files, configure, and compile

./configure --prefix=$target_dir
make
make install

