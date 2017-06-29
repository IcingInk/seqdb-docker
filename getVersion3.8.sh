#!/bin/bash

# Got the zip on the 28th of June 2017, version 3.8 , contains sql+war +context.xml-file - sql only needed here
# wget https://archive.org/download/seqdb-3.8/seqdb-3.8.zip
FILE=seqdb-3.8.zip
SRC=https://archive.org/download/seqdb-3.8/${FILE}
DST=customization

FILE_SQL=*.sql


echo "fetches the artifact from IA"
echo "copying from ${SRC} to ${DST}"
#test -f $DST/$FILE || (cd ${DST} && wget ${SRC} && tar xvfz ${FILE})
test -d $DST || (cd ${DST} && wget ${SRC} && unzip ${FILE})
 
sleep 4

# copies the database dump to mysql_autoload
#test -f mysql_autoload/${FILE_SQL} || cp ${DST}/${FILE_SQL} mysql_autoload
