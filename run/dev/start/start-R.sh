#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-R.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     start-R.sh"
  echo "  Single node: start-R.sh datanode01.dev.bigdata"
  echo "  Multi node:  start-R.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  start-R.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/start/start-R.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/start/start-R.yml --extra-vars "variable_host=$1"
fi~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/start/start-R.yml
