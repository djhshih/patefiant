#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

name="aspera"
version="3.8.0"
build=158555-linux-g2.12-64
target_dir=$PATEFIANT_ROOT
package=$name-$version

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O $package.tar.gz https://download.asperasoft.com/download/sw/connect/${version}/ibm-aspera-connect-${version}.${build}.tar.gz

mkdir $package
tar -xzf $package.tar.gz -C $package
cd $package
bash ibm-aspera-connect-${version}.${build}.sh

# aspera installation directory is hard-coded
ln -s ~/.aspera/connect/bin/ascp $target_dir/
