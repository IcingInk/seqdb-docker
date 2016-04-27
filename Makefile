all: build up

build:
	docker-compose build tomcat
up:
	docker-compose up -d
	@echo "opening the app, please remember to add seqdb.local to /etc/hosts"
	firefox http://seqdb.local/seqdbweb/ &

clean: stop rm

stop:
	docker-compose stop
rm:
	docker-compose rm -vf
