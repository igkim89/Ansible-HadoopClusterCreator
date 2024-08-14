#!/bin/bash

RED_COLOR='\033[0;31m'
GREEN_COLOR='\033[0;32m'
YELLOW_COLOR='\033[0;33m'
NO_COLOR='\033[0m'

echo -n -e "${RED_COLOR}Do you want enable Ranger plugins(HDFS, YARN, Hive, HBase)?${NO_COLOR} (y/n) "
read check_enable

while [ $check_enable != "Y" ] && [ $check_enable != "y" ] && [ $check_enable != "N" ] && [ $check_enable != "n" ]
do
  echo "Invalid input."
  echo -n -e "${RED_COLOR}Do you want enable Ranger plugins(HDFS, YARN, Hive, HBase)?${NO_COLOR} (y/n) "
  read check_enable
done

if [ $check_enable = "Y" ] || [ $check_enable = "y" ]
then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/start/start-rangerPlugin.yml --extra-vars "variable_host=all"
else
  echo -e "${YELLOW_COLOR}Ranger plugins were not enabled.${NO_COLOR}"
fi





