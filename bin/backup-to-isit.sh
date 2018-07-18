#!/bin/bash
source ../env/.env.mysql
NOW=`date +"%Y-%m-%d"`
TARGET=../db-backup
docker exec shared_seqdb_database sh -c 'exec mysqldump ${MYSQL_DATABASE} -u${MYSQL_USER} -p${MYSQL_PASSWORD}' > ${TARGET}/${MYSQL_DATABASE}_${NOW}.sql
echo $NOW >> biobackup.log
scp ${TARGET}/${MYSQL_DATABASE}_${NOW}.sql biobackup:/backup/SEQDB &>>biobackup.log
