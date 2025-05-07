#!/bin/bash

# Set container workspace path
export Nav2_DockerContainer="$(pwd)/Nav2-DockerContainer"

# Make sure X11 permissions are enabled
xhost +local:docker

# Start the container interactively with GUI and mounted workspace
docker run -it \
  --env="DISPLAY=$DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --volume="${Nav2_DockerContainer}:/workspace:rw" \
  --name="ros2_container" \
  --user=ros2user \
  --network=host \
  my-ros2-image \
  /bin/bash -c "source /opt/ros/humble/setup.bash && source /usr/share/gazebo/setup.sh && exec bash"

# Run this script with:
# chmod +x run_container.sh
# ./run_container.sh
