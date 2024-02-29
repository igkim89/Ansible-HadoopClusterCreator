#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-ufk.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  start-ufk.sh"
  echo "  start-ufk.sh datanode01.dev.bigdata"
  echo "  start-ufk.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-ufk.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-ufk.yml --extra-vars "variable_host=$1"
fi