ME=$(USER)

DOCKERHUB_VER=v0.8
DST=customization

all: up

fetch:
	@echo "Getting the artifact from IA, the tar contains war-file and sql-dump"
	./getVersion3.8.sh

fetch-wait:
	@echo "fetching the wait-for-it.sh"
	cd ${DST} && curl --progress -L -s -o wait-for-it.sh \
		https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
		chmod +x wait-for-it.sh

up: fetch
	docker-compose up -d db 
	sleep 4
	docker-compose up -d tomcat
	@echo "If running locally, please remember to add seqdb.nrm.se to /etc/hosts"

# context-path, https://seqdb.nrm.se/seqdb.web-3.8/ , is the same as the war-file (seqdb.web-3.8.war)
test:
	firefox http://seqdb.nrm.se/seqdbweb/ &

test2:
	firefox http://localhost:8080/seqdb.web-3.8/login.jsp

down:
	@docker-compose down

clean: stop rm rm-logs

stop:
	docker-compose stop
rm:
	docker-compose rm -vf

rm-logs:
	rm -f srv/logs/*.log
	rm -f srv/logs/*.txt

build: fetch
  @docker build -t dina/seqdb:${DOCKERHUB_VER} tomcat

release:
	docker push  dina/seqdb:${DOCKERHUB_VER}


# docker exec -it seqdbdocker_tomcat_1 bash
# docker exec -it seqdbdocker_db_1 mysql -u brf -p
