#!/bin/bash

~/.pyenv/shims/ansible-playbook -vv -i /home/igkim/ansible/environments/igkim/hosts.yml /home/igkim/ansible/playbooks/edit/edit-hive.yml

echo -n "Do you want to restart the service now? (y/n) > "
read restart

while [ $restart != "Y" ] && [ $restart != "y" ] && [ $restart != "N" ] && [ $restart != "n" ]
do
  echo "Invalid input."
  echo -n "Do you want to restart the service now? (y/n) > "
  read restart
done

if [ $restart = "Y" ] || [ $restart = "y" ]
then
  ~/.pyenv/shims/ansible-playbook -vv -i /home/igkim/ansible/environments/igkim/hosts.yml /home/igkim/ansible/playbooks/stop/stop-hive.yml
  ~/.pyenv/shims/ansible-playbook -vv -i /home/igkim/ansible/environments/igkim/hosts.yml /home/igkim/ansible/playbooks/start/start-hive.yml
  echo "Service restarted."
else
  echo "Service was not restarted."
  echo "A service restart is required to apply the changed settings."
fi


