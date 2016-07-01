#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

name="r"
version="3.2.3"
#version="3.3.0"
target_dir=$PATEFIANT_ROOT
package=$name-$version

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# download package

wget -O $package.tar.gz https://cran.r-project.org/src/base/R-3/R-${version}.tar.gz

# extract files, configure, and compile

mkdir $package
tar -xzf $package.tar.gz -C $package --strip-components=1
cd $package


./configure \
	--prefix=$target_dir \
	--enable-R-shlib \
	--disable-java

make
make install


# install rip
curl -L https://github.com/djhshih/rip/archive/v0.2.tar.gz | tar -xz --strip-components=1 rip-*/rip
install rip $target_dir/bin

# install additional recommended packages
rip install -p \
	io ggplot2 magrittr dplyr tidyr stringr lubridate \
	devtools roxygen2 testthat

