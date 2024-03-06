#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-hive-metastore.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     stop-hive-metastore.sh"
  echo "  Single node: stop-hive-metastore.sh datanode01.dev.bigdata"
  echo "  Multi node:  stop-hive-metastore.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  stop-hive-metastore.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/stop/stop-hive-metastore.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/stop/stop-hive-metastore.yml --extra-vars "variable_host=$1"
fi
