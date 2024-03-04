#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-kminionExporter.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     stop-kminionExporter.sh"
  echo "  Single node: stop-kminionExporter.sh datanode01.dev.bigdata"
  echo "  Multi node:  stop-kminionExporter.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  stop-kminionExporter.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/stop/stop-kminionExporter.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/stop/stop-kminionExporter.yml --extra-vars "variable_host=$1"
fi
