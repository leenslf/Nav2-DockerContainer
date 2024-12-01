FROM ubuntu:22.04 AS base


ARG DEBIAN_FRONTEND=noninteractive

# Basic dependencies installation
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    curl \
    python3 \
    python3-dev \
    ca-certificates \
    lsb-release \
    software-properties-common \
    gnupg2 \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Set up ROS 2 repository and install ROS 2 Humble
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | gpg --dearmor > /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list \
    && apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-desktop-full \
    python3-rosdep \
    python3-rosinstall \
    python3-colcon-common-extensions \
    && rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep init && rosdep update

# Create a non-root user
ARG USERNAME=rosuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && \
    echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME

# Switch to the non-root user
USER $USERNAME

# Set up environment variables
ENV ROS_DOMAIN_ID=0
ENV ROS_NAMESPACE=robot
ENV HOME=/home/$USERNAME

# Source ROS setup script on shell startup
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Create a workspace
WORKDIR /home/$USERNAME/ros2_ws
RUN mkdir src

# Expose ROS2 related ports (optional)
EXPOSE 11311

# Set the default shell to bash (optional but recommended for compatibility)
SHELL ["/bin/bash", "-c"]

# Example of building a ROS 2 package (modify as needed)
# RUN cd /home/$USERNAME/ros2_ws/src && git clone https://github.com/your-repo/your-package.git
# RUN cd /home/$USERNAME/ros2_ws && colcon build
