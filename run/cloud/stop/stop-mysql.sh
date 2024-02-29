#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-mysql.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     stop-mysql.sh"
  echo "  Single node: stop-mysql.sh datanode01.dev.bigdata"
  echo "  Multi node:  stop-mysql.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  stop-mysql.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-mysql.yml --extra-vars "variable_host=$1"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-mysql.yml --extra-vars "variable_host=$1"
fi
