#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-hbase.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     start-hbase.sh"
  echo "  Single node: start-hbase.sh datanode01.dev.bigdata"
  echo "  Multi node:  start-hbase.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  start-hbase.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-hbase.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-hbase.yml --extra-vars "variable_host=$1"
fi