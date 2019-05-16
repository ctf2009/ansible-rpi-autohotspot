#!/bin/bash
export ANSIBLE_CONFIG="ansible.cfg"

ansible-playbook -i inventories/hosts playbooks/samba.yml --ask-pass