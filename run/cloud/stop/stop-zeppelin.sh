~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-zeppelin.yml

#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-zeppelin.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  stop-zeppelin.sh"
  echo "  stop-zeppelin.sh datanode01.dev.bigdata"
  echo "  stop-zeppelin.sh datanode[01:05].dev.bigdata"
  echo ""
  exit
fi

if [ $# -eq 0 ]; then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-zeppelin.yml
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-zeppelin.yml --extra-vars "variable_host=$1"
fi
