#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

pkgname="cairo"
pkgver="1.14.6"
target_dir=$PATEFIANT_ROOT
package=$pkgname-$pkgver

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# download package

wget -O $package.tar.xz http://cairographics.org/releases/cairo-$pkgver.tar.xz

# extract files, configure, and compile

mkdir $package
tar -xJf $package.tar.xz -C $package --strip-components=1
cd $package

./configure \
  --prefix=${target_dir} \
	--sysconfdir=${target_dir}/etc \
	--localstatedir=${target_dir}/var \
	--disable-static \
	--disable-lto \
	--enable-ps \
	--enable-pdf

make
make -j1 DESTDIR=${target_dir} install

