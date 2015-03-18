# Docker stuff
# Enable this if you want boot2docker to launch on newshell
# $(boot2docker shellinit > /dev/null)
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ISL/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

# Docker helper functions
function docker-killall() {
  docker rmi $(docker images -q)
}

function docker-ip() {
  boot2docker ip 2> /dev/null
}
