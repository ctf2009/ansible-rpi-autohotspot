#!/bin/bash
export ANSIBLE_CONFIG="ansible.cfg"

ansible-playbook -i inventories/hosts playbooks/all.yml --ask-pass