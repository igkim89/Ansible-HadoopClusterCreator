#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-grafana.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  stop-grafana.sh"
  echo "  stop-grafana.sh datanode01.dev.bigdata"
  echo "  stop-grafana.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-grafana.yml --extra-vars "variable_host=$1"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-grafana.yml --extra-vars "variable_host=$1"
fi
