#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

pkgname="pango"
pkgver="1.40.1"
target_dir=$PATEFIANT_ROOT
package=$pkgname-$pkgver

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# download package

wget -O $package.tar.xz http://download.gnome.org/sources/${pkgname}/${pkgver:0:4}/${pkgname}-${pkgver}.tar.xz

# extract files, configure, and compile

mkdir $package
tar -xJf $package.tar.xz -C $package --strip-components=1
cd $package

rm -f pango-view/pango-view.1.in

./configure \
	--prefix=$target_dir \
	--sysconfdir=$target_dir/etc \
	--localstatedir=$target_dir/var \
	--with-included-modules=basic-fc

sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

make
make -j1 DESTDIR=${target_dir} install

