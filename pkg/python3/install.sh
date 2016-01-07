#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

name="python"
version="3.4.3"
target_dir=$PATEFIANT_ROOT
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

# python3 comes with pip: no need to run command below
#wget https://bootstrap.pypa.io/get-pip.py
#$target_dir/bin/python3 get-pip.py

