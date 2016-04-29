# dw-seqdb
work-in-progress <br>
Going from a vagrant-packaging ( dev  - https://bitbucket.org/aafc-mbb/seqdb-vagrant ) to docker-packaging. <br>

## run
Running  the target 'dl-seqdb' in the Makefile downloads the the following files <br>

1. seqdbweb.war 
2. sql-dump


The seqdbweb.war is placed in the 'srv/release', to deploy you have to log into the tomcat-container and deploy that war-file.
Run the target  'make' <br>
login with Admin/Admin

# Environment
## java
Oracle , version 8 <br>
## database
mysql, version 5.6 <br>
## tomcat
version 7.0.69 <br>

