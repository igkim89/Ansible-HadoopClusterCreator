#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-zeppelin.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  start-zeppelin.sh"
  echo "  start-zeppelin.sh datanode01.dev.bigdata"
  echo "  start-zeppelin.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-zeppelin.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-zeppelin.yml --extra-vars "variable_host=$1"
fi