all: build up

build:
	docker-compose build tomcat
up:
	docker-compose up -d
	echo "opening the app"
	firefox http://localhost:8080/seqdbweb/ &

clean: stop rm

stop:
	docker-compose stop
rm:
	docker-compose rm -vf
