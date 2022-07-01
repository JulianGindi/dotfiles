export WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=/Users/jgindi/.pyenv/shims/python
source /usr/local/bin/virtualenvwrapper.sh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi
