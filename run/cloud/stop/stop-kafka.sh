~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-kafka.yml

#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-kafka.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  stop-kafka.sh"
  echo "  stop-kafka.sh datanode01.dev.bigdata"
  echo "  stop-kafka.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-kafka.yml
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-kafka.yml --extra-vars "variable_host=$1"
fi
