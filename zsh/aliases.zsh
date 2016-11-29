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
alias s='screen'
alias tree='tree -C --dirsfirst'
alias rmpyc='find . -name "*.pyc" -delete'
alias ddu='find . -maxdepth 1 -type d -exec du -s {} \;'
alias t='vim -c ":$" ~/.todo'
alias p='ping www.make.sh'
alias gs='git status --short'
alias gg="git status"
alias s="spotify"
alias spoof="spoof-mac.py"
alias rsync="rsync --progress"

# GREP and SED helpers
alias grep='egrep --color=never'
alias sed='sed -E'

alias how="apropos"
alias ds="du -sh"
alias l="clear && pwd && ls -FGl"
alias u="cd .. && l"
alias scheme="rlwrap csi"
alias digga="dig +short"
alias ptr="dig +short -x"
alias c="clear"
alias remember="vim ~/Dropbox\ \(Personal\)/Documents/Bin/remember.txt"
alias wunderlist="wunderline"
alias vim=vim_custom

# Todo Stuff
alias t='python ~/bin/t.py --task-dir ~/ownCloud/tasks --list tasks'
alias tw='python ~/bin/t.py --task-dir ~/ownCloud/tasks --list work'
alias task=t
