# aliases
if [ $PLATFORM = Linux ]; then
  alias ls='ls -F --color=auto'
else
  alias ls='ls -FG'
  alias top='top -ocpu'
fi
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias dir='ll'
alias ll='ls -lh'
alias la='ls -A'
alias vi='vim'
alias tree='tree -C --dirsfirst'
alias rmpyc='find . -name "*.pyc" -delete'
alias ddu='find . -maxdepth 1 -type d -exec du -s {} \;'
alias t='vim -c ":$" ~/.todo'
alias p='ping www.make.sh'
alias gs='git status --short'
alias gg="git status"
alias rsync="rsync --progress"

# GREP and SED helpers
#alias grep='egrep --color=never'
alias sed='sed -E'

alias how="apropos"
alias ds="du -sh"
alias l="clear && pwd && ls -FGl"
alias u="cd .. && l"
alias cl="rlwrap sbcl"
alias digga="dig +short"
alias ptr="dig +short -x"
alias c="clear"

# Todo Stuff
alias lock=i3lock
alias notes="vim ~/Nextcloud/Documents/notes/notes.txt"
alias todo="vim ~/todo.txt"
alias flux="xflux"

# Kubernetes Tools
alias gui="octant"
