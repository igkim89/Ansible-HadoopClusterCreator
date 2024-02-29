#!/bin/bash

if [ $# -gt 1 ]; then
  echo "Usage: stop-spark.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  stop-spark.sh"
  echo "  stop-spark.sh datanode01.dev.bigdata"
  echo "  stop-spark.sh datanode[01:05].dev.bigdata"
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-spark.yml
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-spark.yml --extra-vars "variable_host=server-3.novalocal"
fi
