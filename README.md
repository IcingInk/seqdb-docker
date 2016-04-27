# dw-seqdb
work-in-progress <br>
Going from a vagrant-packaging ( dev  - https://bitbucket.org/aafc-mbb/seqdb-vagrant ) to docker-packaging. <br>

**NB: 2 files are missing <br>**

1. seqdbweb.war, should  'mysql_autoload'-directory
2. sql-dump, should be placed in the 'srv/deployments'-directory

## run
place the war-file and the sql-file in appropriate directories. <br>
type 'make' <br>
opens up the application in firefox by 'http://localhost:8080/seqdbweb/ ' <br>
login with Admin/Admin

# Environment
## java
Oracle , version 8 <br>
## database
mysql, version 5.6 <br>
## tomcat
version 7.0.69 <br>

