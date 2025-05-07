## Setting up

* Install [Docker Engine](https://docs.docker.com/engine/install/ubuntu/).

* Create a [docker usergroup](https://docs.docker.com/engine/install/linux-postinstall/) and add yourself to it to be able to use Docker without `sudo`.

* Run the following to enable GUI applications running as root within the container to display on the host's graphical interface:

  ```bash
  xhost +local:docker
  ```

* Build the Docker image (may take a while):

  ```bash
  docker build -f full.dockerfile -t my-ros2-image .
  ```

* Start the container and set up ROS + Gazebo:

  ```bash
  ./run_container.sh
  ```

  > This will source ROS and Gazebo environments and start the container with GUI support.

* To attach to an existing (stopped) container:

  ```bash
  ./attach_container.sh
  ```

* If a container with the name `ros2_container` already exists and you want to remove it:

  ```bash
  docker rm ros2_container
  ```

## Running Gazebo

* Follow the README at `/arUco_tags` if needed for tag simulation.

* To launch Gazebo with TurtleBot3:

  ```bash
  ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
  ```
