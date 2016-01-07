#!/bin/bash
set -o errexit
set -o nounset

# Script for installing python

# Prerequisites: - gcc
#                - wget

name="phylip"
version="3.696"
target_dir=$PATEFIANT_ROOT
package=$name-$version

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O $package.tar.gz http://evolution.gs.washington.edu/phylip/download/$package.tar.gz
mkdir $package
tar -xzf $package.tar.gz -C $package --strip-components=1
cd $package

# extract files, configure, and compile

cd src
make -f Makefile.unx install
dest_dir=$target_dir/opt/$name
if [[ -d $dest_dir ]]; then rm -r $dest_dir; fi
cp -r ../exe $dest_dir

cd -
