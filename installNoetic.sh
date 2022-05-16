#!/bin/bash

sudo adduser $USER dialout

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install ros-noetic-desktop-full
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# additionnal packages
# sudo apt install -y ros-noetic-urg-node

# sudo rosdep init
# rosdep update

# Make the workspace
mkdir ~/catkin_ws
cd catkin_ws
mkdir -p src
catkin_make
echo "source $HOME/catkin_ws/devel/setup.bash" >> ~/.bashrc

echo "export ROS_MASTER_URI=http://localhost:11311" >> ~/.bashrc

source ~/.bashrc
printenv | grep ROS
