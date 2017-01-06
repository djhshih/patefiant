#!/bin/bash 
set -o errexit

export ROOT=${ROOT:-$HOME/local}

basepath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $ROOT/{bin,lib,share/man,share/info,opt}


cat >>$HOME/.bashrc <<'EOL'

#### BEGIN PATEFIANT ####

[[ -f $HOME/.patefiant.bashrc ]] && . $HOME/.patefiant.bashrc

#### END PATEFIANT ######

EOL

cat >$HOME/.patefiant.bashrc <<EOL
export PATEFIANT_ROOT=$ROOT
EOL

cat $basepath/bashrc >>$HOME/.patefiant.bashrc

