#!/bin/bash

# Got the zip on the 28th of June 2017, version 3.8 , contains sql+war +context.xml-file - sql only needed here
# the war-artifact is only needed when building a new image
FILE=seqdb-3.8.zip
SRC=https://archive.org/download/seqdb-3.8/${FILE}
DST=customization

echo "fetches the artifact from IA"
echo "copying from ${SRC} to the directory ${DST}"
test -f $DST/$FILE || (cd ${DST} && wget ${SRC} && unzip ${FILE})

# Copies the database-dump to the mysql_autoload-directory
FILE_SQL=minimal-sample-data.sql
MYSQL_AUTOLOAD=mysql_autoload

echo "copying the ${DST}/${FILE_SQL} to the directory ${MYSQL_AUTOLOAD}"
test -f ${MYSQL_AUTOLOAD}/${FILE_SQL} || cp ${DST}/${FILE_SQL} ${MYSQL_AUTOLOAD}
