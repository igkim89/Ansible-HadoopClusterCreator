#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-ufk.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     start-ufk.sh"
  echo "  Single node: start-ufk.sh datanode01.dev.bigdata"
  echo "  Multi node:  start-ufk.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  start-ufk.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/start/start-ufk.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/start/start-ufk.yml --extra-vars "variable_host=$1"
fi~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/start/start-ufk.yml
