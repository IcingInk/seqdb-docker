all: dl-seqdb build up

build:
	docker-compose build tomcat
up:
	@echo "dependent on DINA-WEB/proxy-docker running with appropriate certs .... "	
	docker-compose up -d
	@echo "If running locally, please remember to add seqdb.nrm.se to /etc/hosts"
	firefox http://seqdb.nrm.se/seqdbweb/ &

dl-seqdb:
	wget https://archive.org/download/seqdb/seqdb.tgz
	tar xvfz seqdb.tgz
	cp seqdb/seqdbweb.war srv/releases
	cp seqdb/seqdb_genotyping225.sql srv/releases
	cp srv/releases/seqdbweb.war tomcat
	cp srv/releases/seqdb_genotyping225.sql mysql_autoload
	rm -rf seqdb
	#rm seqdb.tgz

clean: stop rm rm-logs

stop:
	docker-compose stop
rm:
	docker-compose rm -vf

rm-logs:
	rm -f srv/logs/*.log
	rm -f srv/logs/*.txt
