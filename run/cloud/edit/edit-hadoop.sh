#!/bin/bash

RED_COLOR='\033[0;31m'
GREEN_COLOR='\033[0;32m'
YELLOW_COLOR='\033[0;33m'
NO_COLOR='\033[0m'

~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/edit/edit-hadoop.yml

echo -n -e "${RED_COLOR}Do you want to restart the Hadoop service now?${NO_COLOR} (y/n) "
read restart

while [ $restart != "Y" ] && [ $restart != "y" ] && [ $restart != "N" ] && [ $restart != "n" ]
do
  echo "Invalid input."
  echo -n -e "${RED_COLOR}Do you want to restart the Hadoop service now?${NO_COLOR} (y/n) "
  read restart
done

if [ $restart = "Y" ] || [ $restart = "y" ]
then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/stop/stop-hadoop.yml
  sleep 5s
  ~/.pyenv/shims/ansible-playbook -vv -i /home/cloud-user/ansible/environments/cloud/hosts.yml /home/cloud-user/ansible/playbooks/start/start-hadoop.yml
else
  echo -e "${YELLOW_COLOR}Hadoop service was not restarted.${NO_COLOR}"
  echo -e "${YELLOW_COLOR}Hadoop service restart is required to apply the changed settings.${NO_COLOR}"
fi





