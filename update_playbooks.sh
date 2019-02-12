#!/bin/bash

#Install the roles from galaxy
ansible-galaxy install --roles-path ./roles --force --role-file cmaker-requirements.yml