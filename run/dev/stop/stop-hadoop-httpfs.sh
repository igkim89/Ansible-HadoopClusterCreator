#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-hadoop-httpfs.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     stop-hadoop-httpfs.sh"
  echo "  Single node: stop-hadoop-httpfs.sh datanode01.dev.bigdata"
  echo "  Multi node:  stop-hadoop-httpfs.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  stop-hadoop-httpfs.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/stop/stop-hadoop-httpfs.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/stop/stop-hadoop-httpfs.yml --extra-vars "variable_host=$1"
fi
