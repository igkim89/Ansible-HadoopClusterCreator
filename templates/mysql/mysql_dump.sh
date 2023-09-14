#!/bin/bash

TODAY=$(date + '%Y%m%d')

{{ mysql.home_dir }}/bin/mysqldump -uroot -p{{ mysql.root_pw }} --socket={{ mysql.socket_dir }}/mysql.sock --all-databases > /home/{{ remote_user }}/mysql_dump/mysql_dump_${TODAY}.sql