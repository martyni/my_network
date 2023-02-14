#!/bin/bash
VAULT_ID=~/.config/my_ansible/ansible.txt
NAME=$1
STRING=$2
echo "encrypting '${STRING}'"
ansible-vault encrypt_string --vault-id $VAULT_ID "${STRING}" --name "${NAME}" 
