#! /bin/bash
# Derniere distribution stretch
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get update

# installation du gestionnaire de clés
sudo apt-get install -y dirmngr

# instalation de ROS distribution kinetic
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential cmake
sudo rosdep init
rosdep update
mkdir -p ~/ros_catkin_ws
cd ~/ros_catkin_ws
rosinstall_generator mobile --rosdistro kinetic --deps --wet-only --tar > kinetic-ros_comm-wet.rosinstall
wstool init src kinetic-ros_comm-wet.rosinstall
rosdep install -y --from-paths src --ignore-src --rosdistro kinetic -r --os=debian:stretch
sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release -j2
cd ..
cd ros_catkin_ws/devel_isolated/
source setup.bash
rospack profile
cd ~
echo "source ~/ros_catkin_ws/devel_isolated/setup.bash">>.bashrc