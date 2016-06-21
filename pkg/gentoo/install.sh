#!/bin/bash

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget http://rsync.prefix.bitzolder.nl/scripts/bootstrap-prefix.sh
chmod +x bootstrap-prefix.sh
./bootstrap-prefix.sh
