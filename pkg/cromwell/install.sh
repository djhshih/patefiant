#!/bin/bash
set -e

# Script for installing cromwell

name=cromwell
version="77"

author=broadinstitute
repo=cromwell
url=https://github.com/$author/$repo/releases/download/${version}/${name}-${version}.jar


# set the installation directory

target_dir=$PATEFIANT_ROOT/java

# download source files for tmux, libevent, and ncurses
# save them in /tmp

mkdir -p $target_dir
wget -O $target_dir/${name}-${version}.jar $url
ln -sf $target_dir/${name}-${version}.jar $target_dir/${name}.jar

echo "java -Xmx1G -XX:+UseSerialGC -jar $target_dir/${name}.jar \"\$@\"" > $name
chmod +x $name
install $name $PATEFIANT_ROOT/bin

