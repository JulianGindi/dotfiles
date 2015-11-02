# python virtualenv
if which virtualenvwrapper.sh >/dev/null 2>&1; then
  export WORKON_HOME=$HOME/.virtualenvs
  . "`which virtualenvwrapper.sh`"
  if [ -z "$VIRTUAL_ENV" ]; then
    if [ -d $WORKON_HOME/default ]; then
      workon default
    else
      mkvirtualenv default
    fi
  fi
fi

# pip
if which pip >/dev/null 2>&1; then
  if [ ! -f ~/.zsh/cache/pip_completion ]; then
    pip completion --zsh | egrep -v '^\s*(#|$)' > ~/.zsh/cache/pip_completion 2>/dev/null
  fi

  . ~/.zsh/cache/pip_completion

  export PIP_RESPECT_VIRTUALENV=true
fi

# Virtualenvwrapper stuff
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
