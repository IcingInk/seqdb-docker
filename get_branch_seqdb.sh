#!/bin/bash

FILE=seqdb_3.5_SNAPSHOT_geno_branch.zip
SRC=https://archive.org/download/seqdb_3.5_SNAPSHOT_geno_branch/${FILE}
DST=customization
FILE_WAR=seqdb.web-3.5-SNAPSHOT.war
FILE_SQL=seqdb_3.5_SNAPSHOT_genotyping.sql


echo "fetches the artifact from IA"
echo "copying from ${SRC} to ${DST}"
#test -f $DST/$FILE || (cd ${DST} && wget ${SRC} && tar xvfz ${FILE})
test -d $DST/geno_branch || (cd ${DST} && wget ${SRC} && unzip ${FILE})
sleep 4

# copies the artifact to tomcat-docker
test -f tomcat/seqdbweb.war || cp ${DST}/geno_branch/${FILE_WAR} tomcat/seqdbweb.war

# copies the database dump to mysql_autoload
test -f mysql_autoload/${FILE_SQL} || cp ${DST}/geno_branch/${FILE_SQL} mysql_autoload
