#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-prometheus.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     stop-prometheus.sh"
  echo "  Single node: stop-prometheus.sh datanode01.dev.bigdata"
  echo "  Multi node:  stop-prometheus.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  stop-prometheus.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/stop/stop-prometheus.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/stop/stop-prometheus.yml --extra-vars "variable_host=$1"
fi