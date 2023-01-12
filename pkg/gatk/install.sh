#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

name=gatk
version=4.3.0.0
target_dir=$PATEFIANT_ROOT/opt/gatk

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# Download and extract

wget https://github.com/broadinstitute/gatk/releases/download/$version/$name-$version.zip
unzip gatk-*.zip && rm gatk-*.zip
mv gatk-* $target_dir

cd -

