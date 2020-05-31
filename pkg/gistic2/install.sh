#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

name="gistic2"
version=2_0_23
target_dir=$PATEFIANT_ROOT/opt/$name
package=$name-$version

# download and install package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

curl -o $package.tar.gz ftp://ftp.broadinstitute.org/pub/GISTIC2.0/GISTIC_${version}.tar.gz
mkdir -p $target_dir/$name
tar -xzf $package.tar.gz -C $target_dir

# install Matlab runtime
cd $target_dir/MCR_Installer
unzip MCRInstaller.zip
./install -mode silent -agreeToLicense yes -destinationFolder $(readlink -f ../MATLAB_Compiler_Runtime/)

# replace executable script
cp $localdir/gistic2 ../gistic2

# clean up
cd - && rm -rf MCR_Installer

