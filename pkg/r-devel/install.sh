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

wget -O $package.tar.gz ftp://ftp.stat.math.ethz.ch/Software/R/R-${version}.tar.gz
mkdir $package
tar -xzf $package.tar.gz -C $package --strip-components=1
cd $package

# extract files, configure, and compile

./configure --prefix=$target_dir --with-x=no
make
make install

