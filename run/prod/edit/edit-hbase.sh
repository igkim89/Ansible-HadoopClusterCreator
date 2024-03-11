#!/bin/bash

RED_COLOR='\033[0;31m'
GREEN_COLOR='\033[0;32m'
YELLOW_COLOR='\033[0;33m'
NO_COLOR='\033[0m'

~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/edit/edit-hbase.yml

echo -e "${YELLOW_COLOR}You can use the Rolling restart.${NO_COLOR} \n"
echo -e "${YELLOW_COLOR}Enter 'r' or 'R' to use HBase Master and RegionServer Rolling restart' function${NO_COLOR} \n"
echo -n -e "${RED_COLOR}Do you want to restart the HBase service now?${NO_COLOR} (y/n/r) "
read restart

while [ $restart != "Y" ] && [ $restart != "y" ] && [ $restart != "N" ] && [ $restart != "n" ] && [ $restart != "M" ] && [ $restart != "m" ] && [ $restart != "R" ] && [ $restart != "r" ]
do
  echo "Invalid input."
  echo -n -e "${RED_COLOR}Do you want to restart the HBase service now?${NO_COLOR} (y/n/r) "
  read restart
done

if [ $restart = "Y" ] || [ $restart = "y" ]
then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/stop/stop-hbase.yml --extra-vars "variable_host=all"
  sleep 10s
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/start/start-hbase.yml --extra-vars "variable_host=all"
elif [ $restart = "R" ] || [ $restart = "r" ]
then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/tool/hbase/master-rolling-restart.yml
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/prod/hosts.yml /home/bigdata/ansible/playbooks/tool/hbase/region-rolling-restart.yml
  echo -e "${GREEN_COLOR}HBase Rolling restart was successful.${NO_COLOR}"
else
  echo -e "${YELLOW_COLOR}HBase service was not restarted.${NO_COLOR}"
  echo -e "${YELLOW_COLOR}HBase service restart is required to apply the changed settings.${NO_COLOR}"
fi






