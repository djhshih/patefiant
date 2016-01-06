#!/bin/bash
set -o errexit
set -o nounset

# Script for installing python

# Prerequisites: - gcc
#                - wget
#                - git

name="medicc"
version="git"
target_dir=$ROOT
package=$name-$version
dest_dir=$target_dir/opt/$name


tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# download package

git clone https://bitbucket.org/rfs/medicc.git
cd medicc/lib
rmdir fstframework
git clone https://bitbucket.org/rfs/fstframework.git
cd ..

# configure and compile

cd medicc_binaries
mkdir bin
make
cd -

cd lib/fstframework/cExtensions
make
cd -

# patch

sed -i "s|#!env python|#!/usr/bin/env python2|" medicc.py

# installl

cd ..
mv medicc $dest_dir

