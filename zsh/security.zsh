# Starting ssh-agent on login
eval `keychain --eval --agents ssh id_ed25519 &> /dev/null` &> /dev/null
