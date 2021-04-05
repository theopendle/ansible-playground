#!/bin/bash


echo "Executing $1"
sshpass -p ansible ssh-copy-id -i $HOME/.ssh/id_rsa ansible@ansible-target

ansible-playbook /playbooks/$1