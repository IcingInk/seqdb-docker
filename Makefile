all: dl-seqdb build up

build:
	docker-compose build tomcat
up:
	docker-compose up -d
	@echo "opening the app, please remember to add seqdb.local to /etc/hosts"
	#firefox http://seqdb.local/seqdbweb/ &

dl-seqdb:
	wget https://archive.org/download/seqdb/seqdb.tgz
	tar xvfz seqdb.tgz
	mv seqdb/seqdb_genotyping225.sql mysql_autoload
	cp seqdb/seqdbweb.war srv/releases
	mv seqdb/seqdbweb.war tomcat
	rm -rf seqdb
	rm seqdb.tgz

clean: stop rm rm-logs

stop:
	docker-compose stop
rm:
	docker-compose rm -vf

rm-logs:
	rm -f srv/logs/*.log
	rm -f srv/logs/*.txt
