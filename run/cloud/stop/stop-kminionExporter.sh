#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-kminionExporter.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  stop-kminionExporter.sh"
  echo "  stop-kminionExporter.sh datanode01.dev.bigdata"
  echo "  stop-kminionExporter.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-kminionExporter.yml
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-kminionExporter.yml --extra-vars "variable_host=$1"
fi
