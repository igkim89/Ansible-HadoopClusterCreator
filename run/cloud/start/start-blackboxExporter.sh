#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-blackboxExporter.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  start-blackboxExporter.sh"
  echo "  start-blackboxExporter.sh datanode01.dev.bigdata"
  echo "  start-blackboxExporter.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-blackboxExporter.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-blackboxExporter.yml --extra-vars "variable_host=$1"
fi

