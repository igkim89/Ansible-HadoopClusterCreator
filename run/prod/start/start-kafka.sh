#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-kafka.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     start-kafka.sh"
  echo "  Single node: start-kafka.sh datanode01.dev.bigdata"
  echo "  Multi node:  start-kafka.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  start-kafka.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/start/start-kafka.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/start/start-kafka.yml --extra-vars "variable_host=$1"
fi
