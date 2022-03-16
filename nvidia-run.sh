#!/bin/bash 
# https://github.com/awslabs/benchmark-ai/issues/17

MOUNT_DIR="$(pwd)"

docker run -it --rm --gpus all --shm-size=4g --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /mnt/wslg:/mnt/wslg \
-v /usr/lib/wsl:/usr/lib/wsl \
--device=/dev/dxg \
-e LD_LIBRARY_PATH=/usr/lib/wsl/lib \
-e DISPLAY=$DISPLAY \
-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
-e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
-e PULSE_SERVER=$PULSE_SERVER \
-v $MOUNT_DIR:/home/tauri/app \
-p 8080:8080 \
albertodeduce/tauri \
bash
