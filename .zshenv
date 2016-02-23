#!/bin/zsh

export PATH=/usr/local/bin:/sbin:/usr/sbin:/bin:/usr/bin

export RBENV_ROOT=~/.rbenv
export PATH=${RBENV_ROOT}/bin:$PATH

# rbenv
which rbenv > /dev/null 2>&1
if [ $? = 0 ]; then
  eval "$(rbenv init -)"
fi
