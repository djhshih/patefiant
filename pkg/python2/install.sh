#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

name="python"
version="2.7.10"
target_dir=$ROOT
package=$name-$version

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O $package.tar.gz https://www.python.org/ftp/python/${version}/Python-${version}.tgz
mkdir $package
tar -xzf $package.tar.gz -C $package --strip-components=1
cd $package

# extract files, configure, and compile

./configure --prefix=$target_dir
make
make install
cd -

# install pip

wget https://bootstrap.pypa.io/get-pip.py
$target_dir/bin/python2 get-pip.py

