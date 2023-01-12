#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

name="npm"
version="10.15.0"
target_dir=$PATEFIANT_ROOT
package=$name-$version


# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O $package.tar.xz https://nodejs.org/dist/v${version}/node-v${version}-linux-x64.tar.xz
mkdir $package
tar -xf $package.tar.xz -C $package --strip-components=1
cd $package

cp -r {bin,lib,include,share} $target_dir

