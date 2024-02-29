~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-prometheus.yml

#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-prometheus.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  start-prometheus.sh"
  echo "  start-prometheus.sh datanode01.dev.bigdata"
  echo "  start-prometheus.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/start-prometheus.yml
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/start-prometheus.yml --extra-vars "variable_host=$1"
fi