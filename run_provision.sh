#!/bin/sh
export ANSIBLE_CONFIG="ansible.cfg"

ansible-playbook -i inventory/hosts playbooks/provision.yml --ask-pass
