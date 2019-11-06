#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

name="go"
version=1.13.4
target_dir=$PATEFIANT_ROOT/opt
package=$name-$version

# download and install package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

curl -o $package.tar.gz https://dl.google.com/go/go${version}.linux-amd64.tar.gz
tar -xzf $package.tar.gz -C $target_dir

