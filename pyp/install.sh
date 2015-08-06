#!/bin/bash
set -e

# Script for installing pyp (Python Power at the Prompt)

# Prerequisites: - gcc
#                - wget

name="pyp"
version=""
target_dir=$ROOT
package=$name-$version

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O $name 'https://docs.google.com/uc?authuser=0&id=0B3RW1AtsOguXNFdjQU1RT000Zzg&export=download'

# install package

install $name $target_dir/bin

