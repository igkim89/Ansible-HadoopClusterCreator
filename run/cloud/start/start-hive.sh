#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-hive.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  start-hive.sh"
  echo "  start-hive.sh datanode01.dev.bigdata"
  echo "  start-hive.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-hive.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-hive.yml --extra-vars "variable_host=$1"
fi