docker images
docker rmi $(docker images -q)

docker ps -aq
docker rm  $(docker ps -aq)

docker build -t lomadi/imdbpy .

docker run -it --rm --name imdbpy  lomadi/imdbpy

docker-compose up -d
docker-compose down

docker logs imdbpy
docker exec -it imdbpy /bin/bash

sudo du -d 2 -h /var/lib/docker/devicemapper | grep 'docker inspect -f "{{.Id}}" imdbpy'


# DB 
docker exec -it imdbpy-database /bin/bash
mysqldump --all-databases > dump.sql
mysql -u imdbpy -p  

use imdbpy;
show tables;


