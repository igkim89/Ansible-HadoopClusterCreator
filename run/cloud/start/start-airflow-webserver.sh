#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-airflow-webserver.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     start-airflow-webserver.sh"
  echo "  Single node: start-airflow-webserver.sh datanode01.dev.bigdata"
  echo "  Multi node:  start-airflow-webserver.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  start-airflow-webserver.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-airflow-webserver.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-airflow-webserver.yml --extra-vars "variable_host=$1"
fi
