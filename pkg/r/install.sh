#!/bin/bash
set -e

# Script for installing python

# Prerequisites: - gcc
#                - wget

name="r"
version="4.5.0"
target_dir=$PATEFIANT_ROOT
package=$name-$version

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# download package

wget -O $package.tar.gz https://cran.r-project.org/src/base/R-4/R-${version}.tar.gz

# extract files, configure, and compile

mkdir $package
tar -xzf $package.tar.gz -C $package --strip-components=1
cd $package


./configure \
	--prefix=$target_dir \
	--enable-R-shlib \
	--disable-java \
	--with-x=yes \

make
make install


# install dependency
fac install rip

# install additional recommended packages
rip install -p \
	io ggplot2 magrittr dplyr tidyr stringr lubridate \
	devtools roxygen2 testthat

