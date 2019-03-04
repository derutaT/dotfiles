#!/bin/zsh

export PATH=/usr/local/bin:/sbin:/usr/sbin:/bin:/usr/bin

export RBENV_ROOT=~/.rbenv
export PATH=${RBENV_ROOT}/bin:$PATH

# rbenv
which rbenv > /dev/null 2>&1
if [ $? = 0 ]; then
  eval "$(rbenv init -)"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# mackerel-ssh
export PATH=$HOME/bin/mackerel-ssh/:$PATH


# Jave Version
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

