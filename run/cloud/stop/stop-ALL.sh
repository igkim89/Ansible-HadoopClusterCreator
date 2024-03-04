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
  stop-checkProcessExporter.sh
  stop-blackboxExporter.sh
  stop-kminionExporter.sh
  stop-nodeExporter.sh
  stop-prometheus.sh
  stop-zeppelin.sh
  stop-airflow.sh
  stop-redis.sh
  stop-R.sh
  stop-hue.sh
  stop-ufk.sh
  stop-spark.sh
  stop-hbase.sh
  stop-hive.sh
  stop-mysql.sh
  stop-hadoop.sh
  stop-kafka.sh
  stop-zookeeper.sh
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