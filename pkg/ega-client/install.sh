#!/bin/bash
set -e

# Script for installing sbt

#                - wget

name="ega-client"
version="2.2.2"
target_dir=$PATEFIANT_ROOT
package=$name-$version

basepath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget https://www.ebi.ac.uk/ega/sites/ebi.ac.uk.ega/files/documents/EgaDemoClient_${version}.zip
unzip EgaDemoClient_${version}.zip

# install package

mv EgaDemoClient.jar $target_dir/java
install $basepath/ega-client $target_dir/bin

