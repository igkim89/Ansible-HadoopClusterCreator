~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-R.yml

#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-R.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  start-R.sh"
  echo "  start-R.sh datanode01.dev.bigdata"
  echo "  start-R.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/start-R.yml
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/start-R.yml --extra-vars "variable_host=$1"
fi