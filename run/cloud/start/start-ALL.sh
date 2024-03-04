#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: start-ALL.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default(All node): start-ALL.sh"
  echo "  Single node:       start-ALL.sh datanode01.dev.bigdata"
  echo "  Multi node:        start-ALL.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:        start-ALL.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

SCRIPT_LIST="
  start-zookeeper.yml
  start-kafka.yml
  start-hadoop.yml
  start-mysql.yml
  start-hive.yml
  start-hbase.yml
  start-spark.yml
  start-ufk.yml
  start-hue.yml
  start-R.yml
  start-redis.yml
  start-airflow.yml
  start-zeppelin.yml
  start-prometheus.yml
  start-nodeExporter.yml
  start-kminionExporter.yml
  start-blackboxExporter.yml
  start-checkProcessExporter.yml
  start-grafana.yml
  start-ranger.yml
"

for SCR in $SCRIPT_LIST ; do
  if [ $# -eq 0 ]; then
    ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/$SCR --extra-vars "variable_host=all"
  else
    ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/$SCR --extra-vars "variable_host=$1"
  fi

  ret_val=$?
  if [ $ret_val -ne 0 ]; then
    exit
  fi
done