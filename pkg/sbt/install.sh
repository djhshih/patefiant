#!/bin/bash
set -e

# Script for installing sbt

#                - wget

name="sbt"
version="0.13.11"
target_dir=$PATEFIANT_ROOT
package=$name-$version

basepath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$version/sbt-launch.jar

# install package

mv sbt-launch.jar $target_dir/java
install $basepath/sbt $target_dir/bin

