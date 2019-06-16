#!/bin/bash

DIRECTORY=inventory

#Install the roles from Ansible Galaxy.
ansible-galaxy install --roles-path ./roles --force --role-file requirements.yml

#Pull the Inventory repository.
if [ ! -d "$DIRECTORY" ]; then
    git clone https://github.com/gzsierra/ansible-inventory.git inventory
else
    cd inventory
    git pull https://github.com/gzsierra/ansible-inventory.git
fi