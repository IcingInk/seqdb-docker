#!/bin/bash

FILE=seqdb.tgz
SRC=https://archive.org/download/seqdb/${FILE}
DST=customization


echo "fetches the artifact from IA"
echo "copying from ${SRC} to ${DST}"
#test -f $DST/$FILE || (cd ${DST} && wget ${SRC} && tar xvfz ${FILE})
test -d $DST/seqdb || (cd ${DST} && wget ${SRC} && tar xvfz ${FILE})
sleep 4

# copies the artifact to tomcat-docker
test -f tomcat/seqdbweb.war || cp ${DST}/seqdb/seqdbweb.war tomcat

# copies the database dump to mysql_autoload
test -f mysql_autoload/seqdb_genotyping225.sql || cp ${DST}/seqdb/seqdb_genotyping225.sql mysql_autoload
