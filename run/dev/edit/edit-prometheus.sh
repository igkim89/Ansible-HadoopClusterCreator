#!/bin/bash

RED_COLOR='\033[0;31m'
GREEN_COLOR='\033[0;32m'
YELLOW_COLOR='\033[0;33m'
NO_COLOR='\033[0m'

~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/edit/edit-prometheus.yml

echo -e "${YELLOW_COLOR}You can use the reload function to apply the changed settings.${NO_COLOR} \n"
echo -e "${YELLOW_COLOR}To use the 'reload' function without restarting, enter 'r' or 'R'${NO_COLOR} \n"
echo -n -e "${RED_COLOR}Do you want to restart the Prometheus service now?${NO_COLOR} (y/n/r) "
read restart

while [ $restart != "Y" ] && [ $restart != "y" ] && [ $restart != "N" ] && [ $restart != "n" ] && [ $restart != "r" ] && [ $restart != "R" ]
do
  echo "Invalid input."
  echo -n -e "${RED_COLOR}Do you want to restart the Prometheus service now?${NO_COLOR} (y/n/r) "
  read restart
done

if [ $restart = "Y" ] || [ $restart = "y" ]
then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/stop/stop-prometheus.yml
  sleep 5s
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/start/start-prometheus.yml
elif [ $restart = "r" ] || [ $restart = "R" ]
then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/bigdata/ansible/environments/dev/hosts.yml /home/bigdata/ansible/playbooks/tool/prometheus/reload-config.yml
  echo -e "${GREEN_COLOR}Prometheus configuration reload was successful.${NO_COLOR}"
else
  echo -e "${YELLOW_COLOR}Prometheus service was not restarted.${NO_COLOR}"
  echo -e "${YELLOW_COLOR}Prometheus service restart is required to apply the changed settings.${NO_COLOR}"
fi






