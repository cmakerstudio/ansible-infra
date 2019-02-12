#!/bin/bash

#Install the roles from Ansible Galaxy.
ansible-galaxy install --roles-path ./roles --force --role-file ansible-requirements/cmaker-requirements.yml