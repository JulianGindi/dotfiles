# Vagrant umask settings
#
vagrant_umask () {
  u=`umask`
  umask 022
  /usr/bin/vagrant "$@"
  umask $u
}

alias vagrant=vagrant_umask
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion
