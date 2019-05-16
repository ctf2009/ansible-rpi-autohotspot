#!/bin/sh
export ANSIBLE_CONFIG="ansible.cfg"

ansible-playbook -i inventories/hosts playbooks/autohotspot.yml --ask-pass
