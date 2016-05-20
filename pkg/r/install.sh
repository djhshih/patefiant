#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

name="r"
version="3.2.3"
target_dir=$PATEFIANT_ROOT
package=$name-$version

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# download package

wget -O $package.tar.gz https://cran.r-project.org/src/base/R-3/R-${version}.tar.gz

# extract files, configure, and compile

mkdir $package
tar -xzf $package.tar.gz -C $package --strip-components=1
cd $package


./configure --prefix=$target_dir
make
make install

