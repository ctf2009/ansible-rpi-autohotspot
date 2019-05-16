#!/bin/bash
export ANSIBLE_CONFIG="ansible.cfg"

ansible-playbook -i inventories/hosts playbooks/ping.yml --ask-pass
