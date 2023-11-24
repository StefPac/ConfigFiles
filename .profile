# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Notice that this is sourced by ~/.zshenv

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# shell-independent environment PATH-related settings

. "$HOME/.cargo/env"

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin":$PATH
    export PATH
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin":$PATH
    export PATH
fi

# Cargo and Rust
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin":$PATH
    export PATH
fi

arch=$(uname -s)
if [ "$arch" = "Darwin" ]; then
    BREW_PREFIX=/opt/homebrew
    PATH=${BREW_PREFIX}/sbin:$PATH
    PATH=${BREW_PREFIX}/bin:$PATH
    export PATH

    BREW_JAVA_PREFIX=$(brew --prefix java);
    PATH=${BREW_JAVA_PREFIX}/bin:$PATH
    export PATH
fi
# Requires pyenv
PYENV_ROOT="$HOME/.pyenv"
export PYENV_ROOT

if ! command -v pyenv >/dev/null 2>&1; then
    PATH="$PYENV_ROOT/bin:$PATH"
    export PATH
    WORKON_HOME="$PYENV_ROOT/versions"
    export WORKON_HOME
fi



