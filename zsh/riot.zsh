export P4CONFIG=.p4config
export ANSIBLE_VAULT_PASSWORD_FILE=.vault_password

alias riot-playbook-github="ansible-playbook -i inventories/inventory.ini --vault-password-file ./.vault_password --become -u admin --private-key ~/.ssh/id_rsa"
