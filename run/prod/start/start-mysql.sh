#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-mysql.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     start-mysql.sh"
  echo "  Single node: start-mysql.sh datanode01.dev.bigdata"
  echo "  Multi node:  start-mysql.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  start-mysql.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/start/start-mysql.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/start/start-mysql.yml --extra-vars "variable_host=$1"
fi
