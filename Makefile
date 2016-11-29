ME=$(USER)
DOCKERHUB_VER=v0.5

all: up

fetch:
	@echo "Getting the artifact from IA, the tar contains war-file and sql-dump"
	./get_seqdb.sh

build: fetch
	@docker build -t dina/seqdb:${DOCKERHUB_VER} tomcat

release:
	docker push  dina/seqdb:${DOCKERHUB_VER}

up:
	@echo "dependent on DINA-WEB/proxy-docker running with appropriate certs .... "	
	docker-compose up -d
	@echo "If running locally, please remember to add seqdb.nrm.se to /etc/hosts"
	firefox http://seqdb.nrm.se/seqdbweb/ &


ps:
	docker-compose ps

clean: stop rm rm-logs

stop:
	docker-compose stop
rm:
	docker-compose rm -vf

rm-logs:
	rm -f srv/logs/*.log
	rm -f srv/logs/*.txt
