#!/bin/bash
set -o errexit
set -o nounset

# Script for installing python

# Prerequisites: - gcc
#                - wget

name="openfst"
version="1.3.2"
target_dir=$PATEFIANT_ROOT
package=$name-$version

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O $package.tar.gz http://www.openfst.org/twiki/pub/FST/FstDownload/$package.tar.gz
mkdir $package
tar -xzf $package.tar.gz -C $package --strip-components=1
cd $package

# extract files, configure, and compile

./configure --prefix=$target_dir \
	--enable-far --enable-pdt
make
make install

mv $target_dir/lib/fst/* $target_dir/lib && rmdir $target_dir/lib/fst

cd -

