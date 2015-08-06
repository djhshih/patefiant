# Purpose

Typically on a remote server or cluster, you do not have root permission to installation software.
If your admins are nice, they will install software for you. Often, they are not very nice or very responsive.

So you are stuck installing software yourself in your `/home` directory.

Linuxbrew is very nice but requires compilation of every software, and source compilation can be challenging if you do not have the 'right' version of the `gcc` compiler.

Most other package managers with binary repositories require root access. For example, both pacman and nix require root access. To get around this limitation, we use `proot`. Unfortunately, `proot` is required for both installing and using the installed software.

# Installation

Most local installations will be placed in `$ROOT`. If you do not set `$ROOT`, it will be set to `$HOME/local` by default.

    cd local && ./install.sh && cd -
    cd proot && ./install.sh && cd -

If you want to use `nix`, install it by

    cd nix && ./install.sh && cd -

If you want to use `pacman` (from Archlinux), install it by

    cd pacman && ./install.sh && cd -

Pacman will be installed into `$ARCH_ROOT` (defaults to `$HOME/arch`).

# Use

To use `nix`, you will need to use proot to set up the shell environment, and we provide `nixroot` for this task.

    nixroot    # enter the nixroot environment
    nix-env -i python 
    exit

If your system's `gcc` is not too old, you can probably run software installed `nix` by invoking them by their full path. It is probably easier to simply use `nixroot` so you can avail yourself of the symbolic links set up by `nix`.

    nixroot python

If you are a fan of Archlinux, you can install all your software using pacman.

    archroot   # enter the archroot environment
    pacman -S base
    exit

Since Archlinux uses the very latest `gcc` and libraries, most programs installed by pacman will probably not run in your native linux environment. So you'll need to enter the `archroot` environment.

    gcc --version
    archroot gcc --version


# Other programs

Simple scripts for retrieving and compiling some programs are available, such as `python2` and `python3`. Chances are your system already comes with its own python. With a local installation of python, however, you can manage your own packages using `pip`!

