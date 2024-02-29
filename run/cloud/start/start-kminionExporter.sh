#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-kminionExporter.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  start-kminionExporter.sh"
  echo "  start-kminionExporter.sh datanode01.dev.bigdata"
  echo "  start-kminionExporter.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-kminionExporter.yml
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-kminionExporter.yml --extra-vars "variable_host=$1"
fi