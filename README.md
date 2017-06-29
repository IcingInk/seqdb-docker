# dw-seqdb
work-in-progress <br>
Going from a vagrant-packaging ( dev  - https://bitbucket.org/aafc-mbb/seqdb-vagrant ) to docker-packaging. <br>

Every new release comes from aafc as a ZIP file containing:

1. war-file (store in the 'tomcat'-directory)
2. sql-dump (store in the 'mysql_autoload'-directory)
3. context.xml (store in the 'tomcat'-directory)

the context.xml has information about the database

1. JNDI-name = jdbc/SeqDBWeb
2. username and password 
3. url="jdbc:mysql://db/seqdbweb?useUnicode=true&amp;characterEncoding=utf-8" 

where 'db' is the container-name ( set in the docker-compose.yml)

## run with the proxy-docker
store the nrm.se.crt- and nrm.se.key-files in the 'certs'-directory

## image is stored at hub.docker.com
1. Check that your version of the image is the same in the docker-compose.yml and in the Makefile
2. latest image is stored in https://hub.docker.com/r/dina/seqdb/tags/
3. the image is populated with seqdb version 3.8 (seqdb.web-3.8.war)


## Run the target  'make' <br>
login with Admin/Admin

# Environment for tomcat
## Java
Oracle-Java , version 8 <br>

## Apache Tomcat
version 7.0.69 <br>

# Environment for database
## DB
MySQL, version 5.6 <br>

## for the developer.
if pushing to hub.docker.com

1. Makefile : set a tag via DOCKERHUB_VER='tag' ( i.e DOCKERHUB_VER=v0.8 )
2. run 'make build'
3. try the image 'make up'
4. push the image :  'make release' 

## how to log in to the docker container

1. docker exec -it seqdbdocker_tomcat_1 bash
2. docker exec -it seqdbdocker_db_1 mysql -u brf -p

Wherer seqdbdocker_tomcat_1 and seqdbdocker_db_1 are the names of the container