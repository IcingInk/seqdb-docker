#! make
ME=$(USER)

VER=3.15
DOCKERHUB_VER=v3.15
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
	docker-compose up -d db 
	sleep 4
	docker-compose up -d tomcat
	@echo "If running locally, please remember to add seqdb.nrm.se to /etc/hosts"

# context-path, https://seqdb.nrm.se/seqdb.web-3.8/ , is the same as the war-file (seqdb.web-3.8.war)

test:
	curl https://seqdb.nrm.se/seqdb.web-3.15/login.jsp

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


# docker exec -it seqdbdocker_tomcat_1 bash
# docker exec -it seqdbdocker_db_1 mysql -u brf -p
