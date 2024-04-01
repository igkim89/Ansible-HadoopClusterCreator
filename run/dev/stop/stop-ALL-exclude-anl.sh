#!/bin/bash

RED_COLOR='\033[0;31m'
GREEN_COLOR='\033[0;32m'
YELLOW_COLOR='\033[0;33m'
NO_COLOR='\033[0m'

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-ALL-exclude-anl.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default(All node): stop-ALL-exclude-anl.sh"
  echo "  Single node:       stop-ALL-exclude-anl.sh datanode01.dev.bigdata"
  echo "  Multi node:        stop-ALL-exclude-anl.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:        stop-ALL-exclude-anl.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

SCRIPT_LIST="
  stop-spark.yml
  stop-hbase.yml
  stop-hive.yml
  stop-hadoop.yml
  stop-kafka.yml
  stop-zookeeper.yml
"

echo ""
echo -n -e "${RED_COLOR}[List of services to be stopped] ${NO_COLOR}"
echo -n -e "  - ZooKeeper"
echo -n -e "  - Kafka"
echo -n -e "  - Hadoop"
echo -n -e "  - Hive"
echo -n -e "  - HBase"
echo -n -e "  - Spark"
echo ""

if [ $# -eq 0 ]; then
  echo -n -e "${RED_COLOR}Do you want to stop this services in the cluster now?${NO_COLOR} (y/n) "
  read restart
else
  echo -n -e "${RED_COLOR}Do you want to stop this services on host $1 now?${NO_COLOR} (y/n) "
  read restart
fi

if [ $restart = "Y" ] || [ $restart = "y" ]; then
  echo "Stop all services..."
else
  exit
fi

for SCR in $SCRIPT_LIST ; do
  if [ $# -eq 0 ]; then
    ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/stop/$SCR --extra-vars "variable_host=all"
  else
    ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/stop/$SCR --extra-vars "variable_host=$1"
  fi
  ret_val=$?
  if [ $ret_val -ne 0 ]; then
    exit
  fi
done