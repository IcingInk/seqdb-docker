#! make
ME=$(USER)
include .env
include env/.env.mysql
TS := $(shell date '+%Y_%m_%d_%H_%M')


all: up

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
	curl -L http://seqdb-dev.nrm.se/seqdb.web-${TAG}/login.js

test-browse:
	xdg-open https://seqdb-dev.nrm.se/seqdb.web-${TAG}/login.jsp &

clean: stop rm rm-logs

stop:
	docker-compose stop
rm:
	docker-compose rm -vf

rm-logs:
	rm -f srv/logs/*.log
	rm -f srv/logs/*.txt

build: 
	@docker build -t ${IMAGE}:v${TAG} tomcat --no-cache

release:
	docker push ${IMAGE}:v${TAG}

db-dump:
	@docker exec shared_seqdb_database sh -c 'exec mysqldump ${MYSQL_DATABASE} -u${MYSQL_USER} -p${MYSQL_PASSWORD}' > ./db-backup/${MYSQL_DATABASE}_${TS}.sql

