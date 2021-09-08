#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

name=juicer
version=1.6
target_dir=$PATEFIANT_ROOT/opt/$name


(
tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# Download and extract

wget https://github.com/aidenlab/juicer/archive/refs/tags/$version.zip
unzip $version.zip && rm $version.zip

# set up symlink
( cd $name-$version && ln -s CPU bin )

mv $name-$version $target_dir
)

