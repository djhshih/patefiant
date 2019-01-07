#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

name="openblas"
version="0.2.20"
target_dir=$PATEFIANT_ROOT
package=$name-$version

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O $package.tar.gz https://github.com/xianyi/OpenBLAS/arhcive/v${version}.tar.gz
mkdir $package
tar -xzf $package.tar.gz -C $package --strip-components=1
cd $package

# extract files, configure, and compile

make
make PREFIX=$target_dir install

