ME=$(USER)
DOCKERHUB_VER=v0.5

DST=customization

all: up

fetch:
	@echo "Getting the artifact from IA, the tar contains war-file and sql-dump"
	./get_seqdb.sh

fetch-wait:
	@echo "fetching the wait-for-it.sh"
	cd ${DST} && curl --progress -L -s -o wait-for-it.sh \
		https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
		chmod +x wait-for-it.sh

build: fetch
	@docker build -t dina/seqdb:${DOCKERHUB_VER} tomcat

release:
	docker push  dina/seqdb:${DOCKERHUB_VER}


up:
	docker-compose up -d db 
	sleep 4
	docker-compose up -d tomcat
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
