#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-ALL-excludeKafkaAnl.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default(All node): start-ALL-excludeKafkaAnl.sh"
  echo "  Single node:       start-ALL-excludeKafkaAnl.sh datanode01.dev.bigdata"
  echo "  Multi node:        start-ALL-excludeKafkaAnl.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:        start-ALL-excludeKafkaAnl.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

SCRIPT_LIST="
  start-zookeeper.yml
  start-hadoop.yml
  start-hive.yml
  start-hbase.yml
  start-spark.yml
  start-redis.yml
"

for SCR in $SCRIPT_LIST ; do
  if [ $# -eq 0 ]; then
    ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/start/$SCR --extra-vars "variable_host=all"
  else
    ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/start/$SCR --extra-vars "variable_host=$1"
  fi

  ret_val=$?
  if [ $ret_val -ne 0 ]; then
    exit
  fi
done