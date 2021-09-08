#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

version=16.0.2
name=jdk-$version

out_dir=$PATEFIANT_ROOT/opt

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# Download google cloud sdk install script
wget -O ${name}.tar.gz --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/16.0.2%2B7/d4a915d82b4c4fbb9bde534da945d746/${name}_linux-x64_bin.tar.gz 
mkdir -p $out_dir
tar -xzvf $name.tar.gz -C $out_dir

