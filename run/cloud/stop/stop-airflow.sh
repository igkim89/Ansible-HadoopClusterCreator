#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-airflow.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  stop-airflow.sh"
  echo "  stop-airflow.sh datanode01.dev.bigdata"
  echo "  stop-airflow.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-airflow.yml
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-airflow.yml --extra-vars "variable_host=$1"
fi
