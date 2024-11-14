#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: install-nodeExporter.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     install-nodeExporter.sh"
  echo "  Single node: install-nodeExporter.sh datanode01.dev.bigdata"
  echo "  Multi node:  install-nodeExporter.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  install-nodeExporter.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/install/install-nodeExporter.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/install/install-nodeExporter.yml --extra-vars "variable_host=$1"
fi