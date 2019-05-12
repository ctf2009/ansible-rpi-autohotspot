#!/bin/bash
export ANSIBLE_CONFIG="ansible.cfg"

ansible-playbook -i inventory/hosts playbooks/ping.yml --ask-pass
