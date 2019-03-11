#Short info about the contents in the files.

## context.xml-file

* database-url : url="jdbc:mysql://db/seqdbweb?useUnicode=true&amp;characterEncoding=utf-8"
* username/password
* JNDI-name is fixed to ='jdbc/SeqDBWeb'

in the database url: 'db' is the name of the database-container

## server.xml-file

* Connector port, 8080/8443
* Context path, '/seqdb_working'
* UserDatabase, reads in the file "conf/tomcat-users.xml"

## tomcat-users.xml

* roles + username/password

## jar
javax.mail.jar-file, included

## war
The seqdbweb.war is fetched <br>
see the ../Makefile <br>

## URL , context path
context-path follows the name of the war-file

https://seqdb.nrm.se/seqdb.web-3.8/login.jsp

