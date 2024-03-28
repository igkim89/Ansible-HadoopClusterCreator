#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-airflow-celeryflower.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     start-airflow-celeryflower.sh"
  echo "  Single node: start-airflow-celeryflower.sh datanode01.dev.bigdata"
  echo "  Multi node:  start-airflow-celeryflower.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  start-airflow-celeryflower.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/start/start-airflow-celeryflower.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/start/start-airflow-celeryflower.yml --extra-vars "variable_host=$1"
fi