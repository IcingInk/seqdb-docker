#!/bin/bash

FILE=sqedb-geneious-branch-war-and-sample-mysql-dump.zip
SRC=https://archive.org/download/sqedb-geneious-branch-war-and-sample-mysql-dump/${FILE}
DST=customization

FILE_WAR=seqdb.web-3.5-SNAPSHOT.war
FILE_SQL=seqdbweb.3.5-SNAPSHOT.sql


echo "fetches the artifact from IA"
echo "copying from ${SRC} to ${DST}"
#test -f $DST/$FILE || (cd ${DST} && wget ${SRC} && tar xvfz ${FILE})
test -d $DST || (cd ${DST} && wget ${SRC} && unzip ${FILE})
sleep 4

# copies the artifact to tomcat-docker
test -f tomcat/seqdbweb.war || cp ${DST}/${FILE_WAR} tomcat/seqdbweb.war

# copies the database dump to mysql_autoload
test -f mysql_autoload/${FILE_SQL} || cp ${DST}/${FILE_SQL} mysql_autoload
