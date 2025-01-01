# Nav2-SpaceTroopers

- Install [Docker Engine](https://docs.docker.com/engine/install/ubuntu/).

- Create a [docker usergroup](https://docs.docker.com/engine/install/linux-postinstall/) and add yourself to it to be able to use docker without sudo.

- Run the following command to build the container:

```bash
docker build -f full.dockerfile -t my-ros2-image .
```
Note: Building may take a while.

- Run the container using:
```bash
docker run -it \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$(pwd):/workspace" \
    --name="ros2_container" \
    --user=root \
    my-ros2-image /bin/bash

```
