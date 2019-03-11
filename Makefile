#! make
ME=$(USER)
include .env
include env/.env.mysql

all: up

up: 
	@echo "Obs, you need to run a proxy"
	docker-compose up -d db 
	sleep 4
	docker-compose up -d seqdb

test-curl:
	curl -L http://seqdb.nrm.se/seqdb.web-${TAG}/login.js

test-browser:
	xdg-open https://seqdb.nrm.se/seqdb.web-${TAG}/login.jsp &

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

