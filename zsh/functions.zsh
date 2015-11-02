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

# Aws role deligation
function aws_acc1() { 
  . ~/.aws/mfacli.sh $1 863453247731 admin; }

function password() {
  openssl rand -base64 $1
}
