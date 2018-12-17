#!/bin/bash


IMAGE_NAME=alpine-check

if [ "$1" = "rebuild" ]; then  
	docker rmi $IMAGE_NAME
	docker build -t "$IMAGE_NAME" .
else 
	docker build -t "$IMAGE_NAME" .
fi 