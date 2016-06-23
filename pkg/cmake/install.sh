#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

pkgname="cmake"
pkgver="3.5.2"
target_dir=$PATEFIANT_ROOT
package=$pkgname-$pkgver

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# download package

wget -O $package.tar.xz http://cmake.org/files/v${pkgver%.*}/$package.tar.gz

# extract files, configure, and compile

mkdir $package
tar -xzf $package.tar.xz -C $package --strip-components=1
cd $package

./bootstrap \
  --prefix=${target_dir}

make
make -j1 install

