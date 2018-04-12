#! make
ME=$(USER)
include .env
TS := $(shell date '+%Y_%m_%d_%H_%M')

#VER=3.15
DOCKERHUB_VER=v3.189
DST=customization

all: up

fetch:
	@echo "Getting the artifact from IA, the tar contains war-file and sql-dump"
	./getVersion${VER}.sh

fetch-wait:
	@echo "fetching the wait-for-it.sh"
	cd ${DST} && curl --progress -L -s -o wait-for-it.sh \
		https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
		chmod +x wait-for-it.sh

#up: fetch
up: 
	@echo "Obs, you need to run a proxy"
	docker-compose up -d db 
	sleep 4
	docker-compose up -d tomcat

up-dev:
	@echo "Obs, you need to run a proxy"
	docker-compose -f docker-compose.dev.yml up -d db 
	sleep 4
	docker-compose -f docker-compose.dev.yml up -d tomcat 
	@echo "If running locally, please remember to add seqdb.nrm.se to /etc/hosts"

test-curl:
	curl -L http://seqdb.nrm.se/seqdb.web-3.189/login.jsp

test-browse:
	xdg-open http://seqdb.nrm.se/seqdb.web-3.189/login.jsp

clean: stop rm rm-logs

stop:
	docker-compose stop
rm:
	docker-compose rm -vf

rm-logs:
	rm -f srv/logs/*.log
	rm -f srv/logs/*.txt

build: 
	@docker build -t dina/seqdb:${DOCKERHUB_VER} tomcat

release:
	docker push  dina/seqdb:${DOCKERHUB_VER}


db-dump:
	@docker exec shared_seqdb_database sh -c 'exec mysqldump ${MYSQL_DATABASE} -u${MYSQL_USER} -p${MYSQL_PASSWORD}' > ./db-backup/${MYSQL_DATABASE}_${TS}.sql


# docker exec -it seqdbdocker_tomcat_1 bash
# docker exec -it seqdbdocker_db_1 mysql -u brf -p
