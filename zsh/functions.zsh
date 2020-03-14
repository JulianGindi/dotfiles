# functions


function rmpyc() {
  find . -name "*.pyc" -delete
}

function up() {
  local op=print
  [[ -t 1 ]] && op=cd
  case "$1" in
    '') up 1;;
    -*|+*) $op ~$1;;
    <->) $op $(printf '../%.0s' {1..$1});;
    *) local -a seg; seg=(${(s:/:)PWD%/*})
       local n=${(j:/:)seg[1,(I)$1*]}
       if [[ -n $n ]]; then
         $op /$n
       else
         print -u2 up: could not find prefix $1 in $PWD
         return 1
       fi
  esac
}

function password() {
  openssl rand -base64 $1
}

function vim_custom() {
  # First check for a vimrc in current directory
  if [ -f vimrc ]
  then
    /usr/bin/vim -u vimrc $1
  else
    /usr/bin/vim $1
  fi
}

function brightness() {
  xbacklight -set $1
}

function ramdisk() {
  mkdir /tmp/ramdisk && chmod 777 /tmp/ramdisk &&
    sudo mount -t tmpfs -o size=512M tmpfs /tmp/ramdisk
}

function football() {
  cp "/home/gindi/.var/app/com.valvesoftware.Steam/Sports Interactive/Football Manager 2018/games/fcsm.fm" ~/Nextcloud/
}

function timezone() {
  timedatectl set-timezone $(curl https://ipapi.co/timezone)
}

function strongkey() {
  ssh-keygen -t ed25519 -a 100 -C "julian@gindi.io"
}

function _ssh_companion() {
  local SSH_AGENT_SIDECAR=ssh-agent

  docker start ${SSH_AGENT_SIDECAR} 1&> /dev/null || \
    (
      docker run -d \
        --name ${SSH_AGENT_SIDECAR} \
        nardeas/ssh-agent 1&> /dev/null \
        && \
        docker run -it --rm \
        --volumes-from=ssh-agent \
        -v ~/.ssh:/.ssh \
        nardeas/ssh-agent \
        ssh-add /root/.ssh/id_rsa
      )
    }

  alias ssh-companion=_ssh_companion
