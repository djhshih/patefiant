#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

name=igv
version=2.19
version_minor=4
target_dir=$PATEFIANT_ROOT/opt/$name

url=https://data.broadinstitute.org/igv/projects/downloads/${version}/IGV_${version}.${version_minor}.zip

(
tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# Download and extract

wget -O ${name}.zip $url
unzip ${name}.zip && rm ${name}.zip

mv IGV_${version}.${version_minor} $target_dir
)

