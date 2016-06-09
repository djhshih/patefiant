#!/bin/bash
set -o errexit

name="jartools"
version="0.1"
target_dir=$PATEFIANT_ROOT

basepath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

install $basepath/javar $target_dir/bin
install $basepath/{jar-install,jar-wrap} $target_dir/bin

