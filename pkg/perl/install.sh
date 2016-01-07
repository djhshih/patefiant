#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

name="perl"
version="5.22.0"
target_dir=$PATEFIANT_ROOT
package=$name-$version

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O $package.tar.gz http://www.cpan.org/src/5.0/$package.tar.gz
mkdir $package
tar -xzf $package.tar.gz -C $package --strip-components=1
cd $package

# extract files, configure, and compile

./Configure -des -Dprefix=$target_dir
make test
make install

# modify .bashrc

echo 'export PERL5LIB=$target_dir/lib/perl5:${PERL5LIB}' >> $HOME/.bashrc

# option
echo 'Optional steps:'
echo "$target_dir/bin/cpan App::cpanminus"
echo
echo "After completing this step, you can install any module by"
echo "$target_dir/bin/cpanm Module::Name"
echo

