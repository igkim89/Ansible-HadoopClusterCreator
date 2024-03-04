#!/bin/bash

if [ $# -gt 1 ]; then
  echo ""
  echo "Usage: stop-ALL.sh [<SERVER_FQDN>]"
  echo "Example:"
  echo "  Default(All node): stop-ALL.sh"
  echo "  Single node:       stop-ALL.sh datanode01.dev.bigdata"
  echo "  Multi node:        stop-ALL.sh datanode[01:05:09].dev.bigdata"
  echo "  Range node:        stop-ALL.sh datanode[01-05].dev.bigdata"
  echo ""
  exit
fi

SCRIPT_LIST="
  stop-ranger.yml
  stop-grafana.yml
  stop-checkProcessExporter.yml
  stop-blackboxExporter.yml
  stop-kminionExporter.yml
  stop-nodeExporter.yml
  stop-prometheus.yml
  stop-zeppelin.yml
  stop-airflow.yml
  stop-redis.yml
  stop-R.yml
  stop-hue.yml
  stop-ufk.yml
  stop-spark.yml
  stop-hbase.yml
  stop-hive.yml
  stop-mysql.yml
  stop-hadoop.yml
  stop-kafka.yml
  stop-zookeeper.yml
"

for SCR in $SCRIPT_LIST ; do
  if [ $# -eq 0 ]; then
    ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/$SCR --extra-vars "variable_host=all"
  else
    ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/$SCR --extra-vars "variable_host=$1"
  fi

  ret_val=$?
  if [ $ret_val -ne 0 ]; then
    exit
  fi
done