# define ROOT unless previously defined
export ROOT=${ROOT:-$HOME/local}

mkdir -p $ROOT/{bin,lib,share}

echo "export ROOT=$ROOT" >> $HOME/.bashrc
# use single quotes for literal printing
echo 'export PATH=$ROOT/bin:$PATH' >> $HOME/.bashrc
echo 'export LD_LIBRARY_PATH=$ROOT/lib:$LD_LIBRARY_PATH' >> $HOME/.bashrc

. $HOME/.bashrc
