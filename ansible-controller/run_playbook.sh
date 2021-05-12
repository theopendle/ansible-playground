#!/bin/bash

sshpass -p ansible ssh-copy-id -o "StrictHostKeyChecking no" -i $HOME/.ssh/id_rsa ansible@ansible-target

command="ansible-playbook ${@}"

echo "Executing ${command}"

bash -c "${command}"