#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-checkProcessExporter.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  stop-checkProcessExporter.sh"
  echo "  stop-checkProcessExporter.sh datanode01.dev.bigdata"
  echo "  stop-checkProcessExporter.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-checkProcessExporter.yml
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-checkProcessExporter.yml --extra-vars "variable_host=$1"
fi
