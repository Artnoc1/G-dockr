#!/bin/bash 

IMAGE_NAME=cswl/steam-ubuntu-docker
CONTAINER_NAME=steamy-ubuntu-docky
VOLUME_NAME=steam-ubuntu-vol

USER=steamer

echo "Running container $CONTAINER_NAME from image $IMAGE_NAME..."

docker start "$CONTAINER_NAME" > /dev/null 2> /dev/null || {
	echo "Creating new container..."
	docker run \
	       --detach \
	       --tty \
		   --net host  \
		   --user "$USER"  \
		   -e "DISPLAY=unix$DISPLAY" \
	       --mount 'type=volume,src=steam-ubuntu-vol,dst=/mnt/storage' \
		   -v "$XAUTHORITY:/home/steamer/.Xauthority" \
	       --name $CONTAINER_NAME \
		   $IMAGE_NAME 
}

# Run the Steam by default
if [ "$#" -eq  "0" ]; then
	docker exec --user $USER $CONTAINER_NAME steam
elif [ "$1" = "shell" ]; then
	docker exec -it --user $USER $CONTAINER_NAME /bin/bash
elif [ "$1" = "stop" ]; then
	docker stop $CONTAINER_NAME
else
	docker exec $CONTAINER_NAME "$@"
fi

 