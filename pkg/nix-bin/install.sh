#!/bin/bash

. ../lib.sh

name="nix"
build="205129001"
arch="x86_64-unknown-linux-musl"
target_dir=$PATEFIANT_ROOT

curl -L https://hydra.nixos.org/build/${build}/download/1/nix \
	> $target_dir/bin/nixb
chmod +x $target_dir/bin/nixb

