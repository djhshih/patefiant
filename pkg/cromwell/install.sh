#!/bin/bash
set -e

# Script for installing cromwell

name=cromwell
version="86"

author=broadinstitute
repo=cromwell
url=https://github.com/$author/$repo/releases/download/${version}/${name}-${version}.jar


# set the installation directory

target_dir=$PATEFIANT_ROOT/java

config_dir=$PATEFIANT_ROOT/opt/cromwell/etc/
config_path=$config_dir/config

# download source files for tmux, libevent, and ncurses
# save them in /tmp

mkdir -p $target_dir
mkdir -p $config_dir

install_jar() {
	jname=$1
	config=$2

	wget -O $target_dir/${jname}-${version}.jar $url
	ln -sf $target_dir/${jname}-${version}.jar $target_dir/${jname}.jar

	echo "java -Xmx1G -XX:+UseSerialGC $config -jar $target_dir/${jname}.jar \"\$@\"" > $jname
	chmod +x $jname
	mv $jname $PATEFIANT_ROOT/bin
}

install_jar $name "-Dconfig.file=$config_path"
install_jar womtool

# install default configuration file
cp config $config_path
