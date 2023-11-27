#!/bin/bash 
set -euo pipefail

# required parameter: ROOT

basepath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $ROOT/{bin,lib,share/man,share/info,opt}

if [[ -w $HOME/.bashrc ]]; then
# .bashrc is writable: automatically write the required configuration

	cat >>$HOME/.bashrc <<-'EOL'

		#### BEGIN PATEFIANT ####

		[[ -f $HOME/.patefiant.bashrc ]] && . $HOME/.patefiant.bashrc

		#### END PATEFIANT ######

	EOL

	echo "Your ~/.bashrc has been modifed."

else

	cat <<-'EOL'

		You need to add the following to your ~/.bashrc:

		[[ -f $HOME/.patefiant.bashrc ]] && . $HOME/.patefiant.bashrc

	EOL

fi

sed "s|PATEFIANT_ROOT=.*|PATEFIANT_ROOT=$ROOT|" $basepath/bashrc > $HOME/.patefiant.bashrc

