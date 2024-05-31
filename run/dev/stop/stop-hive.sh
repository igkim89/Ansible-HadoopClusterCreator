#!/bin/bash

RED_COLOR='\033[0;31m'
GREEN_COLOR='\033[0;32m'
YELLOW_COLOR='\033[0;33m'
NO_COLOR='\033[0m'

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-hive.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default:     stop-hive.sh"
  echo "  Single node: stop-hive.sh datanode01.dev.bigdata"
  echo "  Multi node:  stop-hive.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:  stop-hive.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

SCRIPT_LIST="
  stop-hbase.yml
  stop-hive.yml
"

if [ $# -eq 0 ]; then
  echo ""
  echo -e "${RED_COLOR}[List of services that will be stopped if you enter 'Y' or 'y'] ${NO_COLOR}"
  echo -e "  - HBase"
  echo -e "  - Hive"
  echo ""
  echo -e "${RED_COLOR}[List of services that will be stopped if you enter 'N' or 'n'] ${NO_COLOR}"
  echo -e "  - Hive"
  echo ""
  echo -n -e "${RED_COLOR}Do you want to stop dependency service?${NO_COLOR} (y/n) "
  read dependency

  if [ $dependency = "Y" ] || [ $dependency = "y" ]; then
    for SCR in $SCRIPT_LIST ; do
      ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/stop/$SCR --extra-vars "variable_host=all"
    done
  elif [ $dependency = "N" ] || [ $dependency = "n" ]; then
    ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/stop/stop-hive.yml --extra-vars "variable_host=all"
  else
    echo "Invalid character."
    exit 1
  fi
else
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/stop/stop-hive.yml --extra-vars "variable_host=$1"
fi
