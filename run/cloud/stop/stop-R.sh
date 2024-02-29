#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-R.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     stop-R.sh"
  echo "  Single node: stop-R.sh datanode01.dev.bigdata"
  echo "  Multi node:  stop-R.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  stop-R.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-R.yml --extra-vars "variable_host=all"
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-R.yml --extra-vars "variable_host=$1"
fi
