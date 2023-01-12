#!/bin/bash

RED_COLOR='\033[0;31m'
GREEN_COLOR='\033[0;32m'
NO_COLOR='\033[0m'

~/.pyenv/shims/ansible-playbook -vv -i /home/igkim/ansible/environments/igkim/hosts.yml /home/igkim/ansible/playbooks/edit/edit-hive.yml

echo -n "${RED_COLOR}Do you want to restart the service now?${NO_COLOR} (y/n) > "
read restart

while [ $restart != "Y" ] && [ $restart != "y" ] && [ $restart != "N" ] && [ $restart != "n" ]
do
  echo "Invalid input."
  echo -n "${RED_COLOR}Do you want to restart the service now?${NO_COLOR} (y/n) > "
  read restart
done

if [ $restart = "Y" ] || [ $restart = "y" ]
then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/igkim/ansible/environments/igkim/hosts.yml /home/igkim/ansible/playbooks/stop/stop-hive.yml
  ~/.pyenv/shims/ansible-playbook -vv -i /home/igkim/ansible/environments/igkim/hosts.yml /home/igkim/ansible/playbooks/start/start-hive.yml
  echo "${GREEN_COLOR}Service restarted.${NO_COLOR}"
else
  echo "Service was not restarted."
  echo "A service restart is required to apply the changed settings."
fi


