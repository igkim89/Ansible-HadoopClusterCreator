#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-zookeeper.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  start-zookeeper.sh"
  echo "  start-zookeeper.sh datanode01.dev.bigdata"
  echo "  start-zookeeper.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-zookeeper.yml
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-zookeeper.yml --extra-vars "variable_host=$1"
fi