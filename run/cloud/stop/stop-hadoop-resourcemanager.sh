#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-hadoop-resourcemanager.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     stop-hadoop-resourcemanager.sh"
  echo "  Single node: stop-hadoop-resourcemanager.sh datanode01.dev.bigdata"
  echo "  Multi node:  stop-hadoop-resourcemanager.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  stop-hadoop-resourcemanager.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-hadoop-resourcemanager.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-hadoop-resourcemanager.yml --extra-vars "variable_host=$1"
fi
