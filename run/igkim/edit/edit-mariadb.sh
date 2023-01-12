#!/bin/bash

RED_COLOR='\033[0;31m'
GREEN_COLOR='\033[0;32m'
YELLOW_COLOR='\033[0;33m'
NO_COLOR='\033[0m'

~/.pyenv/shims/ansible-playbook -vv -i /home/igkim/ansible/environments/igkim/hosts.yml /home/igkim/ansible/playbooks/edit/edit-mariadb.yml

echo -n -e "${RED_COLOR}Do you want to restart the MariaDB service now?${NO_COLOR} (y/n) "
read restart

while [ $restart != "Y" ] && [ $restart != "y" ] && [ $restart != "N" ] && [ $restart != "n" ]
do
  echo "Invalid input."
  echo -n -e "${RED_COLOR}Do you want to restart the MariaDB service now?${NO_COLOR} (y/n) "
  read restart
done

if [ $restart = "Y" ] || [ $restart = "y" ]
then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/igkim/ansible/environments/igkim/hosts.yml /home/igkim/ansible/playbooks/stop/stop-mariadb.yml
  ~/.pyenv/shims/ansible-playbook -vv -i /home/igkim/ansible/environments/igkim/hosts.yml /home/igkim/ansible/playbooks/start/start-mariadb.yml
else
  echo -e "${YELLOW_COLOR}MariaDB service was not restarted.${NO_COLOR}"
  echo -e "${YELLOW_COLOR}MariaDB service restart is required to apply the changed settings.${NO_COLOR}"
fi





