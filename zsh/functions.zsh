# functions

# isl-cloud vagrant shortcut
function islvag() {
    if [ -z "$1" ]; then
        VAGRANT_CWD="$HOME/Projects/isl-cloud" vagrant status
    else
        VAGRANT_CWD="$HOME/Projects/isl-cloud" vagrant $@
    fi
}


function rmpyc() {
  find . -name "*.pyc" -delete
}
