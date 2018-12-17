#!/bin/bash


IMAGE_NAME=cswl/steam-ubuntu-docker
CONTAINER_NAME=steamy-ubuntu-docky
VOLUME_NAME=steam-ubuntu-vol

if [ "$1" = "rebuild" ]; then 
	docker stop  $CONTAINER_NAME
	docker rm $CONTAINER_NAME
	docker rmi $IMAGE_NAME
	docker build -t "$IMAGE_NAME" .
else 
	docker build -t "$IMAGE_NAME" .
fi 